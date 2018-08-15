"
I'm a dynamic finder. 
I use the meta link to discover the coverage of Test
"
Class {
	#name : #SmTReflectivityTestFinderStrategy,
	#superclass : #SmTTestFinderDynamicStrategy,
	#category : 'SmartTest-Finder'
}

{ #category : #testing }
SmTReflectivityTestFinderStrategy class >> isConcreteFinder [
	^ true
]

{ #category : #api }
SmTReflectivityTestFinderStrategy >> analyseAndRemoveProxyFor: aTestCase [
		MetaLink uninstallAll
]

{ #category : #api }
SmTReflectivityTestFinderStrategy >> buildCacheFromTestSuite: aTestSuite [
	aTestSuite flatCollectTests do: [ :aTestCase | self installProxyFor: aTestCase. aTestCase run ].
	MetaLink uninstallAll
]

{ #category : #search }
SmTReflectivityTestFinderStrategy >> collectAllRelativePackages: aByteString [
	^ RPackageOrganizer default packages select: [ :a | (self filter extractPackageBaseName: a packageName) = aByteString ]
]

{ #category : #search }
SmTReflectivityTestFinderStrategy >> collectRelativeTestMethodOfMethods: methods [
	^ (((methods collect: [ :aMethod | aMethod asTestMethod ])
		select: [ :aTestMethod | aTestMethod isNotNil ])
		reject: [ :aTestMethod | self isCORAMethodBlacklisted: aTestMethod ])
		asSet
		collect: [ :method | method methodClass selector: method selector ]
]

{ #category : #api }
SmTReflectivityTestFinderStrategy >> extractCompiledMethodFromReceiver: receiver andSelector: selector [
	" (self class environment at: aSendNode receiver methodNode compiledMethod) lookupSelector: aSendNode selector"
	^  receiver class lookupSelector: selector 
]

{ #category : #api }
SmTReflectivityTestFinderStrategy >> extractCurrentTestExecutionFromContext: ctxt [
	| aTestCase aCompiledTestCase |
 	aTestCase := ctxt arguments at: 1.
 	aCompiledTestCase := aTestCase class >> aTestCase selector.
 	^ aCompiledTestCase compiledMethod
]

{ #category : #initialization }
SmTReflectivityTestFinderStrategy >> initializeLink [
	| link |
	link := MetaLink new
		metaObject: [ :ctxt | 
			| aCompiledTestCase |
			aCompiledTestCase := self extractCurrentTestExecutionFromContext: ctxt.
			self initializeLinkInCompiledMethod: aCompiledTestCase.
			self currentTestExecution: aCompiledTestCase ];
		selector: #value:;
		arguments: #(context);
		level: 0;
		optionOneShot: true.
	(TestExecutionEnvironment >> #runTestCase:) ast link: link
]

{ #category : #initialization }
SmTReflectivityTestFinderStrategy >> initializeLinkInCompiledMethod: aCompiledMethod [
	| link |
	link := MetaLink new
		metaObject: [ :receiver :selector | 
			| receiverCompiledMethod |
			receiverCompiledMethod := self extractCompiledMethodFromReceiver: receiver andSelector: selector.
			(self isCompiledMethod: receiverCompiledMethod alreadyExploredForTest: self currentTestExecution)
				ifFalse: [ self initializeLinkInCompiledMethod: receiverCompiledMethod ].
			self addATest: self currentTestExecution toMethod: receiverCompiledMethod ];
		selector: #value:value:;
		arguments: #(receiver selector);
		level: 0;
		optionOneShot: true.
	aCompiledMethod sendNodes do: [ :node | node link: link ]
]

{ #category : #api }
SmTReflectivityTestFinderStrategy >> installLinkAndRunTest: aTestMethod [
	| testEnv |
	self currentTestExecution: aTestMethod.
	self initializeLinkInCompiledMethod: (aTestMethod class >> aTestMethod selector).

	testEnv := TestExecutionEnvironment new.
	[testEnv beActiveDuring: [
		testEnv runTestCase: aTestMethod]] on: Exception do: [  ].
]

{ #category : #api }
SmTReflectivityTestFinderStrategy >> installProxyFor: aTestCase [
	self currentTestExecution: aTestCase.
	self addATest: aTestCase toMethod: aTestCase.
	self initializeLinkInCompiledMethod: aTestCase class >> aTestCase selector
]

{ #category : #testing }
SmTReflectivityTestFinderStrategy >> isCORAMethodBlacklisted: aCompiledMethod [
	^ (aCompiledMethod pragmaAt: #CORATestBlacklisted) isNotNil
]

{ #category : #testing }
SmTReflectivityTestFinderStrategy >> isCompiledMethod: receiverCompiledMethod alreadyExploredForTest: testInstance [
	self cache
		at: receiverCompiledMethod methodReference
		ifPresent: [ :aSetOfTestInstance | ^ aSetOfTestInstance includes: (testInstance class >> testInstance selector) methodReference  ]
		ifAbsent: [ ^ false ]
]

{ #category : #private }
SmTReflectivityTestFinderStrategy >> methodsInSimilarPackageAs: aCompiledMethod [
		
	| packageBaseName packages |
	packageBaseName := self filter extractCompiledMethodPackageBaseName: aCompiledMethod.
	packages := self collectAllRelativePackages: packageBaseName.
	^ packages
		flatCollect: [ :aPackage | aPackage package correspondingRPackage methods ]
]

{ #category : #search }
SmTReflectivityTestFinderStrategy >> searchRelativeTestForMethod: aCompiledMethod [
	"Search for only one package and NOT relative others method"

	| methods |

	methods := self methodsInSimilarPackageAs: aCompiledMethod.
	((self collectRelativeTestMethodOfMethods: methods) asOrderedCollection sort: [ :a :b | a printString < b printString ])
		do: [ :aTestMethod | self installLinkAndRunTest: aTestMethod ]
		displayingProgress: [ :aClass | 'Processing ' , aClass asString ]
		every: 1
]

{ #category : #private }
SmTReflectivityTestFinderStrategy >> searchTestsForAStandardMethod: aCompiledMethod [
	self cache
		at: aCompiledMethod methodReference
		ifAbsent: [ self searchRelativeTestForMethod: aCompiledMethod ].
	^ (self searchTestsForMethod: aCompiledMethod) collect: #compiledMethod
]

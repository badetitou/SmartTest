"
The Wrapper strategy is a dynamic test regression finder.

It only does the reseach for method one by one.

  ts := TestSuite new.
ts addTest: (SmTClassTest selector: #testMethod1).
ts addTest: (SmTClassTest selector: #testMethod2).
ts addTest: (SmTClassTest selector: #testMethod3).
ts addTest: (SmTClassTest selector: #testMethod4).
sf := SmartFinder new.
sf smtFinder: SmTTestCoverageTestFinderStrategy new.
sf buildCacheFromTestSuite: ts.
sf cacheValues 
"
Class {
	#name : #SmTTestCoverageTestFinderStrategy,
	#superclass : #SmTTestFinderDynamicStrategy,
	#instVars : [
		'wrappers'
	],
	#category : #'SmartTest-Finder'
}

{ #category : #protocol }
SmTTestCoverageTestFinderStrategy class >> collectPackageWithBaseName: aBaseNamePackage [
	^ RPackageOrganizer default packages select: [ :p | aBaseNamePackage,'*' match: p packageName ]
]

{ #category : #protocol }
SmTTestCoverageTestFinderStrategy class >> collectPackagesFromName: aPackageName [
	^ self collectPackageWithBaseName: (self extractPackageBaseName: aPackageName) 
]

{ #category : #protocol }
SmTTestCoverageTestFinderStrategy class >> extractPackageBaseName: aPackageName [
	^(aPackageName substrings: '-') at: 1
]

{ #category : #protocol }
SmTTestCoverageTestFinderStrategy class >> isConcreteFinder [
	^ true
]

{ #category : #adding }
SmTTestCoverageTestFinderStrategy >> addATest: aTestCase toACollectionOfMethod: aCollectionOfCompiledMethod [
	aCollectionOfCompiledMethod
		do: [ :aCompiledMethod | self addATest: aTestCase toMethod: aCompiledMethod ]
]

{ #category : #adding }
SmTTestCoverageTestFinderStrategy >> addATest: aTestCase toMethodReference: aMethodReference [
	(self searchTestsForMethodReference: aMethodReference)
		add: aTestCase methodReference
]

{ #category : #adding }
SmTTestCoverageTestFinderStrategy >> addImpactedTestFromWrapper: aTestMethod theTestMethod: wrappers [
	|  suite testRunner |
	testRunner := TestRunner new.
	suite := TestSuite new.
	suite addTest: aTestMethod.
	testRunner runSuite: suite.
	self updateCacheAndUnmarkFrom: wrappers forMethod: aTestMethod.
]

{ #category : #jenkins }
SmTTestCoverageTestFinderStrategy >> addRelevantTest: aTestMethod fromMarkedWrappers: wrappers [
	| suite testRunner |
	testRunner := TestRunner new.
	suite := TestSuite new.
	suite addTest: aTestMethod.
	testRunner runSuite: suite.
	self updateCacheAndUnmarkFrom: wrappers forMethod: aTestMethod .

]

{ #category : #adding }
SmTTestCoverageTestFinderStrategy >> addToCurrentExecutionMethodReference: aMethodReference [
	| he |
	he := thisContext contextStack reject: [ :c | c selector = #DoIt ] thenCollect: [ :a | a method methodReference ].
	((he includes: self currentTestExecution methodReference) or: [(he collect: #selector) includes: #buildCacheFromTestSuite:])
		ifTrue: [ self addATest: self currentTestExecution toMethodReference: aMethodReference ]
]

{ #category : #api }
SmTTestCoverageTestFinderStrategy >> analyseAndRemoveProxyFor: aTestCase [
	(wrappers at: aTestCase) do: [ :each | each uninstall ].
	wrappers removeKey: aTestCase 
]

{ #category : #accessing }
SmTTestCoverageTestFinderStrategy >> availableMethods [
	"Collect the methods that can be used with the wrapper to fill completely the methodToTest dictionnary"
	^ (self availablePackages flatCollect: [ :aPackage | aPackage methods ])
		reject: [ :method | 
			method methodClass = SmTTestCoverage
				or: [ method methodClass = SmTTestCoverageTestFinderStrategy
						or: [ method methodClass = SmTTestFinderStrategy
								or: [ method methodClass = SmTBasicCacheStrategy or: [ method methodClass = HDTestCoverage or: [ method methodClass = SmTTestFinderDynamicStrategy] ] ] ] ] ]
]

{ #category : #accessing }
SmTTestCoverageTestFinderStrategy >> availablePackages [
	"Collect the packages that can be used with the wrapper to fill completely the methodToTest dictionnary"
	| availablePackages |
	(availablePackages := RPackageOrganizer default packages
		reject: [ :package | 
			(package packageName beginsWith: 'Kernel')
				or: [ (package packageName beginsWith: 'Collections')
						or: [ (package packageName beginsWith: 'GT')
or: [ (package packageName beginsWith: 'Ring')
								or: [ (package packageName beginsWith: 'Regex')
										or: [ (package packageName beginsWith: 'Exceptions')
												or: [ (package packageName beginsWith: 'SUnit')
														or: [ (package packageName beginsWith: 'System') or: [ (package packageName endsWith: 'Tests')
																or: [ package packageName includesSubstring: 'HudsonBuildTools20' caseSensitive: false ] ] ] ] ] ] ] ] ] ])
		sort: [ :a :b | a packageName < b packageName ].
	^ availablePackages
]

{ #category : #accessing }
SmTTestCoverageTestFinderStrategy >> availableTestMethods [
	"Collect the test methods that can be used with the wrapper to fill completely the methodToTest dictionnary"
	^ (self availableTestPackages flatCollect: [ :aPackage | aPackage methods ])  reject: [ :method | method methodClass = SmTTestCoverage ]
]

{ #category : #accessing }
SmTTestCoverageTestFinderStrategy >> availableTestPackages [
	"Collect the test packages that can be used with the wrapper to fill completely the methodToTest dictionnary"
	| availablePackages |
	(availablePackages := RPackageOrganizer default packages
		reject: [ :package | 
			(package packageName beginsWith: 'Kernel')
				or: [ (package packageName beginsWith: 'Collections')
						or: [ (package packageName beginsWith: 'GT')
							or: [ (package packageName beginsWith: 'AST')
								or: [ (package packageName beginsWith: 'Athens')
								or: [ (package packageName beginsWith: 'Ring')
									or: [ (package packageName beginsWith: 'Alien')
									or: [ (package packageName beginsWith: 'Announcements')
										or: [ (package packageName beginsWith: 'Regex')
												or: [ (package packageName beginsWith: 'Exceptions')
														or: [ (package packageName beginsWith: 'SUnit') or: [ (package packageName beginsWith: 'System') or: [ package packageName includesSubstring: 'HudsonBuildTools20' caseSensitive: false ] ] ] ] ] ] ] ] ] ] ] ] ])
		sort: [ :a :b | a packageName < b packageName ].
	^ availablePackages
]

{ #category : #api }
SmTTestCoverageTestFinderStrategy >> buildCacheFromTestSuite: aTestSuite [
"tr := TestRunner new.
tr open.
testSuites := tr allSelectedTestSuites.
ts := TestSuite new.
(testSuites flatCollect: [ :ts | ts tests ]) do: [ :atest | ts addTest: atest ].
[sf := SmartFinder new.
sf smtFinder: SmTTestCoverageTestFinderStrategy new.
sf buildCacheFromTestSuite: ts.
sf cacheValues ] timeToRun 
"
	| listOfPackage methodToWrap |
	listOfPackage := (aTestSuite flatCollectTests flatCollect: [ :aTestCase | self class collectPackagesFromName: aTestCase class package name ]) asSet collect: #packageName.
	methodToWrap := Set new.
	methodToWrap addAll: (self collectMethodToTestForPackagesNamed: listOfPackage).
	"methodToWrap addAll: (self collectClassToTestForPackagesNamed: listOfPackage)."
	methodToWrap := methodToWrap reject: [ :meth | meth isExtension ].
	methodToWrap := methodToWrap intersection: self availableMethods.
	wrappers at: aTestSuite put: (methodToWrap asOrderedCollection collect: [ :each | (SmTTestCoverage on: each methodReference) finder: self ]).
	(wrappers at: aTestSuite) do: [ :each | each install ] "displayingProgress: [ :aClass | 'Installing ' , aClass asString ] every: 1".
	aTestSuite flatCollectTests
		do: [ :aTestCase | 
			self currentTestExecution: aTestCase.
			self addATest: aTestCase toMethodReference: aTestCase methodReference.
			aTestCase run.
			(wrappers at: aTestSuite) do: [ :each | each unmark ] ].
	(wrappers at: aTestSuite) do: [ :each | each uninstall ]
]

{ #category : #search }
SmTTestCoverageTestFinderStrategy >> collectAllRelativePackages: aByteString [
	^ RPackageOrganizer default packages select: [ :a | (self filter extractPackageBaseName: a packageName) = aByteString ]
]

{ #category : #jenkins }
SmTTestCoverageTestFinderStrategy >> collectClassToTestForPackage: aPackage [
	(self availablePackages includes: aPackage)
		ifTrue: [ ^ (aPackage classes reject: #isTrait)
				flatCollect: [ :aClass | SmTClassTestedRule new methodUsingVariablesOfClass: aClass ] ].
	^ OrderedCollection new
]

{ #category : #jenkins }
SmTTestCoverageTestFinderStrategy >> collectClassToTestForPackagesNamed: aCollectionOfPackagesNamed [
	^ aCollectionOfPackagesNamed flatCollect: [ :aPackageName | self collectClassToTestForPackage: (self getPackageFromName: aPackageName) ]
]

{ #category : #jenkins }
SmTTestCoverageTestFinderStrategy >> collectMethodToTestForPackage: aPackage [
	^ aPackage methods
]

{ #category : #jenkins }
SmTTestCoverageTestFinderStrategy >> collectMethodToTestForPackages: aCollectionOfPackage [
	^ aCollectionOfPackage flatCollect: [ :aPackage | self collectMethodToTestForPackage: aPackage ]
]

{ #category : #jenkins }
SmTTestCoverageTestFinderStrategy >> collectMethodToTestForPackagesNamed: aCollectionOfPackagesName [
	^ aCollectionOfPackagesName flatCollect: [ :aPackageName | self collectMethodToTestForPackage: (self getPackageFromName: aPackageName ) ]	
]

{ #category : #parsing }
SmTTestCoverageTestFinderStrategy >> extractPackageBaseName: aPackageName [
	^(aPackageName substrings: '-') at: 1
]

{ #category : #accessing }
SmTTestCoverageTestFinderStrategy >> getPackageFromName: aPackageName [
	^ RPackage organizer packageNamed: aPackageName.
]

{ #category : #initialization }
SmTTestCoverageTestFinderStrategy >> initialize [
	wrappers := Dictionary new
]

{ #category : #api }
SmTTestCoverageTestFinderStrategy >> installProxyFor: aTestCase [
	| methodToWrap listOfPackage |
	self currentTestExecution: aTestCase.
	self addATest: aTestCase toMethodReference: aTestCase methodReference.
	listOfPackage := OrderedCollection new.
	listOfPackage addAll: (SmalltalkImage current packages select: [ :package | package name beginsWith: (self extractPackageBaseName: (aTestCase methodReference compiledMethod package name)) ] ).
	methodToWrap := Set new.
	methodToWrap addAll: (self collectMethodToTestForPackagesNamed: (listOfPackage collect: #name)).
	methodToWrap := methodToWrap intersection: self availableMethods.
	wrappers
		at: aTestCase
		put:
			(methodToWrap asOrderedCollection
				collect: [ :each | (SmTTestCoverage on: each methodReference) finder: self ]).
	((wrappers at: aTestCase) sort: [ :a :b | a name < b name ])
		do: [ :each | each install ]
		displayingProgress: [ :aClass | 'Installing ' , aClass asString ]
		every: 1
]

{ #category : #api }
SmTTestCoverageTestFinderStrategy >> methodsInSimilarPackageAs: aCompiledMethod [
		
	| packageBaseName packages |
	packageBaseName := self filter extractCompiledMethodPackageBaseName: aCompiledMethod.
	packages := self collectAllRelativePackages: packageBaseName.
	^ packages
		flatCollect: [ :aPackage | aPackage methods ]
]

{ #category : #search }
SmTTestCoverageTestFinderStrategy >> searchRelativeTestForMethod: aCompiledMethod [
	"Search for only one package and NOT relative others method"
	| methods |
	methods := self methodsInSimilarPackageAs: aCompiledMethod.
	
	wrappers := {(HDTestCoverage on: aCompiledMethod methodReference)} asOrderedCollection.
	wrappers do: [ :each | each install ].
	[
	 
		(self collectRelativeTestMethodOfMethods: methods)
			do: [ :aTestMethod | self addImpactedTestFromWrapper: aTestMethod theTestMethod: wrappers ]
			displayingProgress: [ :aClass | 'Processing ' , aClass asString ]
			every: 1
		
	] ensure: [ wrappers do: [ :each | each uninstall ] ]
]

{ #category : #api }
SmTTestCoverageTestFinderStrategy >> searchTestsForAStandardMethod: aCompiledMethod [
	self searchRelativeTestForMethod: aCompiledMethod.
	^ self searchTestsForMethod: aCompiledMethod
]

{ #category : #api }
SmTTestCoverageTestFinderStrategy >> searchTestsForClass: aClass [
	"Find all tests in related packages that reference the method's class"
	| allSendersClass allTests |
	allSendersClass := (aClass allCallsOn 
							collect: [:aReference| 
									 aReference actualClass]) asSet
							select: [:aColectedClass| 
									(aColectedClass isKindOf: TestCase class) ].
	
	allTests := OrderedCollection new.
	allSendersClass do: [:aSenderClass|  allTests addAll: aSenderClass allTestMethods].
	^ allTests.
]

{ #category : #jenkins }
SmTTestCoverageTestFinderStrategy >> updateCacheAndUnmarkFrom: wrappers forMethod: aTestMethod [
	| aToResetAfterMarkCollection |
	aToResetAfterMarkCollection := wrappers select: [ :each | each hasRun ].
	self addATest: aTestMethod toACollectionOfMethod: aToResetAfterMarkCollection.
	aToResetAfterMarkCollection do: [ :each | each unmark ]
]

"
I represent an abstract strategy to find tests exercising some method
"
Class {
	#name : #SmTTestFinderStrategy,
	#superclass : #Object,
	#instVars : [
		'filter',
		'cache',
		'shouldTryToFindTestForDynamic'
	],
	#category : 'SmartTest-Finder'
}

{ #category : #protocol }
SmTTestFinderStrategy class >> isConcreteFinder [
	^ false
]

{ #category : #accessing }
SmTTestFinderStrategy >> cache [
	^ cache
]

{ #category : #accessing }
SmTTestFinderStrategy >> cache: aSmTCache [
	cache := aSmTCache 
]

{ #category : #accessing }
SmTTestFinderStrategy >> computeInheritedTestFromDiscoveredTest: aCollectionOfRGDefinitionOfTest [
	| testList |
	testList := OrderedCollection new.
	aCollectionOfRGDefinitionOfTest
		do: [ :anRGDefinition | 
			anRGDefinition methodClass isAbstract
				ifTrue: [ testList addAll: (self subTestFromRGDefinition: anRGDefinition) ]
				ifFalse: [ testList add: anRGDefinition ] ].
	^ testList asSet 
]

{ #category : #accessing }
SmTTestFinderStrategy >> filter [
	^ filter
]

{ #category : #accessing }
SmTTestFinderStrategy >> filter: aSmTFilter [
	filter := aSmTFilter 
]

{ #category : #initialization }
SmTTestFinderStrategy >> initialize [
	self shouldTryToFindTestForDynamic: false
]

{ #category : #accessing }
SmTTestFinderStrategy >> methodToTest: anObject [
	cache methodToTest: anObject
]

{ #category : #api }
SmTTestFinderStrategy >> methodsFor: aCompiledMethod [
	^ self cache
		at: aCompiledMethod methodReference
		ifAbsent: [ (self searchTestsForATestMethod: aCompiledMethod)
				ifNotEmpty: [ :methods | 
					^ (self searchTestsForMethod: aCompiledMethod)
						addAll: (self computeInheritedTestFromDiscoveredTest: methods);
						yourself ].
			(self searchTestsForASetUpMethod: aCompiledMethod)
				ifNotEmpty: [ :methods | 
					^ (self searchTestsForMethod: aCompiledMethod)
						addAll: (self computeInheritedTestFromDiscoveredTest: methods);
						yourself ].
			(self searchTestsForATearDownMethod: aCompiledMethod)
				ifNotEmpty: [ :methods | 
					^ (self searchTestsForMethod: aCompiledMethod)
						addAll: (self computeInheritedTestFromDiscoveredTest: methods);
						yourself ].
			(self searchTestsForAStandardMethod: aCompiledMethod)
				ifNotEmpty: [ :methods | 
					^ (self searchTestsForMethod: aCompiledMethod)
						addAll: (self computeInheritedTestFromDiscoveredTest: methods);
						yourself ].
			self cache at: aCompiledMethod methodReference put: Set new.
			^ {} ]
]

{ #category : #'private - search' }
SmTTestFinderStrategy >> recursiveSearchForAClass: aClass inPackages: packagesToLookAt [
	^ self recursiveSearchForAClass: aClass inPackages: packagesToLookAt alreadyVisited: Set new
]

{ #category : #'private - search' }
SmTTestFinderStrategy >> recursiveSearchForAClass: aClass inPackages: packagesToLookAt alreadyVisited: alreadyVisitedClass [
	| testsFound allCallsOnClass |
	testsFound := Set new.
	aClass isTestCase
		ifTrue: [ (aClass methods select: [ :aMethod | aMethod isTestMethod ]) do: [ :eachTestMethod | testsFound addAll: (self methodsFor: eachTestMethod) ].
			aClass allTestSelectors do: [ :each | testsFound add: (RGMethodDefinition className: aClass name selector: each isMetaSide: false) ] ].
	testsFound
		addAll:
			((aClass allCallsOn select: [ :aCallOn | (filter shouldEntityBeFilteredOut: aCallOn inPackages: packagesToLookAt) not ])
				flatCollect: [ :aRGMethodDefinition | self methodsFor: aRGMethodDefinition compiledMethod]).
	aClass subclasses
		reject: [ :aSubClass | 
			| reject |
			reject := (filter shouldEntityBeFilteredOut: aSubClass inPackages: packagesToLookAt) or: [ alreadyVisitedClass includes: aSubClass ].
			alreadyVisitedClass add: aSubClass.
			reject ]
		thenDo: [ :aSubClass | 
			testsFound add: aSubClass.
			testsFound addAll: (self recursiveSearchForAClass: aSubClass inPackages: packagesToLookAt alreadyVisited: alreadyVisitedClass) ].
	^ testsFound
]

{ #category : #accessing }
SmTTestFinderStrategy >> searchTestsForAClass: aClass [
	| packagesToLookAt |
	packagesToLookAt := self filter extractPackagesFrom: aClass.
	^ self recursiveSearchForAClass: aClass inPackages: packagesToLookAt
]

{ #category : #accessing }
SmTTestFinderStrategy >> searchTestsForAInstVar: aInstVar [
	"This method returns all the tests related to a instance variable."

	| testsFound |
	testsFound := Set new.
	^ testsFound
]

{ #category : #accessing }
SmTTestFinderStrategy >> searchTestsForAInstVar: aInstanceVariable OfClass: aClass [
	"This method returns all the tests related to a instance variable."

	| testsFound senders |
	testsFound := Set new.
	senders := Set new.
	senders
		addAll: ((aClass classLayout allVisibleSlots select: [ :eachSlot | eachSlot name = aInstanceVariable ]) flatCollect: #usingMethods).
	testsFound
		addAll: (senders flatCollect: [ :each | self methodsFor: each ]).
	^ testsFound
]

{ #category : #private }
SmTTestFinderStrategy >> searchTestsForASetUpMethod: aCompiledMethod [
	"If the method is a TestCase setUp, returns all the tests of this TestCase and its subclasses"
	^ (aCompiledMethod isTestSetUpMethod) 
				ifTrue: [|result|
					result := OrderedCollection new. 
					result addAll: aCompiledMethod methodClass allTestMethods.
					(aCompiledMethod methodClass subclasses do:[:aSubClass | result addAll: aSubClass allTestMethods]). 
					result collect: #methodReference]
				ifFalse: [{}].
]

{ #category : #private }
SmTTestFinderStrategy >> searchTestsForAStandardMethod: aCompiledMethod [
	"Should return a Collection of #methodReference"
	
	self subclassResponsibility 
]

{ #category : #private }
SmTTestFinderStrategy >> searchTestsForATearDownMethod: aCompiledMethod [
	"If the method is a TestCase tearDown, returns all the tests of this TestCase"
	^ (aCompiledMethod isTestTearDownMethod) 
				ifTrue: [
					|result|
					result := OrderedCollection new. 
					result addAll: aCompiledMethod methodClass allTestMethods.
					(aCompiledMethod methodClass subclasses do:[:aSubClass | result addAll: aSubClass allTestMethods]).
					result collect: #methodReference]
				ifFalse: [{}].
]

{ #category : #private }
SmTTestFinderStrategy >> searchTestsForATestMethod: aCompiledMethod [
	^ aCompiledMethod isTestMethod
				ifTrue: [{aCompiledMethod methodReference}]
				ifFalse: [{}].
]

{ #category : #accessing }
SmTTestFinderStrategy >> searchTestsForATrait: aTrait [
	| packagesToLookAt testsFound|
	testsFound := Set new.
	packagesToLookAt := self filter extractPackagesFrom: aTrait.
	aTrait users do: [:eachClass | testsFound addAll: (self recursiveSearchForAClass: eachClass inPackages: packagesToLookAt)].
	^testsFound 
]

{ #category : #private }
SmTTestFinderStrategy >> searchTestsForClassReferenceOf: aCompiledMethod [
	"Find all tests in related packages that reference the method's class"
	| allSendersClass allTests |
	allSendersClass := (aCompiledMethod methodClass allCallsOn 
							collect: [:aReference| 
									 aReference actualClass]) asSet
							select: [:aClass| 
									(aClass isKindOf: TestCase class) ].
	
	allTests := OrderedCollection new.
	allSendersClass do: [:aClass|  allTests addAll: aClass allTestMethods].
	^ allTests collect: #methodReference.
]

{ #category : #accessing }
SmTTestFinderStrategy >> searchTestsForMethod: aCompiledMethod [
	^ self cache relevantTestsFor: aCompiledMethod 
		"at: aCompiledMethod methodReference
		ifAbsentPut: [ Set new ]"
]

{ #category : #accessing }
SmTTestFinderStrategy >> searchTestsForMethodReference: aMethodReference [
	^ self cache searchTestsForMethodReference: aMethodReference 
]

{ #category : #accessing }
SmTTestFinderStrategy >> shouldTryToFindTestForDynamic [
	^ shouldTryToFindTestForDynamic
]

{ #category : #accessing }
SmTTestFinderStrategy >> shouldTryToFindTestForDynamic: aBoolean [
	shouldTryToFindTestForDynamic := aBoolean
]

{ #category : #accessing }
SmTTestFinderStrategy >> subTestFromRGDefinition: anRGDefinition [
	^ self
		computeInheritedTestFromDiscoveredTest:
			((anRGDefinition methodClass suite tests flatCollect: #tests)
				collect: [ :each | RGMethodDefinition class: each class selector: each selector ])
]

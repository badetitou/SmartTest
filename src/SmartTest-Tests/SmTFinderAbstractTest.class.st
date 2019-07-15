"
This class exists to test the behaviour of the different finders with diffeent settings.
TODO

	- test setUp method with teardown
	- test setUp method with setup
	- test tearDown with setup
	- test tearDown with teardown
"
Class {
	#name : #SmTFinderAbstractTest,
	#superclass : #TestCase,
	#instVars : [
		'cache',
		'smartFinder',
		'testMethod2',
		'testMethod1',
		'testMethod3',
		'testMethod4',
		'testMethod5',
		'testInheritedMethod1',
		'testMethodOutsidePackage1',
		'testMethod1OutsidePackage'
	],
	#category : #'SmartTest-Tests-Finder'
}

{ #category : #testing }
SmTFinderAbstractTest class >> isAbstract [

	^ self  == SmTFinderAbstractTest
]

{ #category : #helpers }
SmTFinderAbstractTest >> searchTestMethodsFor: aCompiledMethod [
	
	^ smartFinder researchTestsForMethod: aCompiledMethod .
]

{ #category : #helpers }
SmTFinderAbstractTest >> searchTestsForASetUpMethod: aCompiledMethod [
	^ smartFinder searchTestsForASetUpMethod: aCompiledMethod
]

{ #category : #helpers }
SmTFinderAbstractTest >> searchTestsForATearDownMethod: aCompiledMethod [
	^ smartFinder searchTestsForATearDownMethod: aCompiledMethod
]

{ #category : #helpers }
SmTFinderAbstractTest >> searchTestsForATestMethod: aCompiledMethod [
	^ smartFinder searchTestsForATestMethod: aCompiledMethod
]

{ #category : #running }
SmTFinderAbstractTest >> setUp [
	super setUp.
	self timeLimit: 45 seconds.	"super super long time for travis CI"
	smartFinder := SmartFinder new.
	smartFinder filter: SmTDefaultClassPackagesFilter new.
	testMethod1 := (SmTClassTest >> #testMethod1) asRingDefinition.
	testMethod2 := (SmTClassTest >> #testMethod2) asRingDefinition.
	testMethod3 := (SmTClassTest >> #testMethod3) asRingDefinition.
	testMethod4 := (SmTClassTest >> #testMethod4) asRingDefinition.
	testMethod5 := (SmTClassTest >> #testMethod5) asRingDefinition.
	testInheritedMethod1 := RGMethodDefinition className: 'SmTInheritClassTest' selector: #testMethod1 isMetaSide: false
]

{ #category : #running }
SmTFinderAbstractTest >> tearDown [
	"reset the cache"
	smartFinder emptyCache.
	smartFinder clean.
	super tearDown
]

{ #category : #tests }
SmTFinderAbstractTest >> testInheritance [
	<CORATestBlacklisted>
	| testsFound testMethod |
	testsFound := self searchTestMethodsFor: ('SmTP1' , 'Inheritance') asClass >> ('method1','Inheritance') asSymbol .
testMethod := RGMethodDefinition className: ('SmTP1InheritanceSubClass2','Test') selector:('testMethod1','Inheritance') asSymbol isMetaSide:	false.
	self assert: testsFound size equals: 2.
	self assert: (testsFound includes: ((('SmTP1InheritanceSubClass1Test') asClass >> ('testMethod1Inheritance') asSymbol) asRingDefinition  )).
	self assert: (testsFound includes: (testMethod) ).
]

{ #category : #tests }
SmTFinderAbstractTest >> testModificationOnInitialize [
	<CORATestBlacklisted>
	| testsFound |self
		timeLimit:
			35
				seconds.	
					"this one needs more time than the other"
					self flag: 'Takes a very long time'.
	testsFound := self searchTestMethodsFor: SmTClass2 >> #initialize.

	self deny: (testsFound includes: testMethod1).
	self deny: (testsFound includes: testMethod2).
	self deny: (testsFound includes: testMethod3).
	self deny: (testsFound includes: testMethod4).
	self assert: (testsFound includes: testMethod5).
]

{ #category : #tests }
SmTFinderAbstractTest >> testModificationOnTest [
"asserts that if a test method is modified, the tests founds includes itself."
	<CORATestBlacklisted>
	| testsFound |
	testsFound := self searchTestMethodsFor: SmTClassTest >> #testMethod4.
	self deny: (testsFound includes: testMethod1).
	self deny: (testsFound includes: testMethod2).
	self deny: (testsFound includes: testMethod3).
	self assert: (testsFound includes: testMethod4).
]

{ #category : #tests }
SmTFinderAbstractTest >> testSetupMethodFindsTests [
"asserts that the method SmTClassTest>>setup is related to the testMethods 1 to 4 and that 'testsForASetupMethod' finds all the good tests related to a setup method."
	<CORATestBlacklisted>
	| testsFound |
	testsFound := self searchTestsForASetUpMethod: SmTClassTest >> #setUp.

	self assert: testsFound isNotEmpty.
	self assert: (testsFound includes: testMethod1).
	self assert: (testsFound includes: testMethod2).
	self assert: (testsFound includes: testMethod3).
	self assert: (testsFound includes: testMethod4).
]

{ #category : #tests }
SmTFinderAbstractTest >> testSetupMethodWithNonSetupFindsNoTests [
"asserts that if we use the method 'testsForASetupMethod' with a non setup method as a parameter, the method returns nothing"
	<CORATestBlacklisted>
	| testsFound |
	testsFound := self searchTestsForASetUpMethod: SmTClassTest >> #testMethod1.

	self assert: testsFound isEmpty.
]

{ #category : #tests }
SmTFinderAbstractTest >> testStandardMethodFirstLevelSenders [
	<CORATestBlacklisted>
	| testsFound |
	testsFound := self searchTestMethodsFor: SmTClass >> #method2.
	self deny: (testsFound includes: testMethod1).
	self assert: (testsFound includes: testMethod2).
	self deny: (testsFound includes: testMethod3).
	self deny: (testsFound includes: testMethod4).
]

{ #category : #tests }
SmTFinderAbstractTest >> testStandardMethodSecondLevelSenders [
	<CORATestBlacklisted>
	| testsFound |
	testsFound := self searchTestMethodsFor: SmTClass >> #method1.
	self assert: (testsFound includes: testMethod1).
	self assert: (testsFound includes: testMethod2).
	self assert: (testsFound includes: testInheritedMethod1).
	self deny: (testsFound includes: testMethod3).
	self deny: (testsFound includes: testMethod4).
]

{ #category : #tests }
SmTFinderAbstractTest >> testStandardMethodThirdLevelSenders [
	<CORATestBlacklisted>
	| testsFound | 
	testsFound := self searchTestMethodsFor: SmTClass >> #method4.

	self deny: (testsFound includes: testMethod1).
	self assert: (testsFound includes: testMethod2).
	self assert: (testsFound includes: testMethod3).
	self assert: (testsFound includes: testMethod4).
]

{ #category : #tests }
SmTFinderAbstractTest >> testTearDownMethodFindsTests [
	<CORATestBlacklisted>
	| testsFound |
	testsFound := self searchTestsForATearDownMethod: SmTClassTest >> #tearDown.

	self assert: testsFound isNotEmpty.
	self assert: (testsFound includes: testMethod1).
	self assert: (testsFound includes: testMethod2).
	self assert: (testsFound includes: testMethod3).
	self assert: (testsFound includes: testMethod4).
]

{ #category : #tests }
SmTFinderAbstractTest >> testTearDownMethodWithNoneTearDownFindsNoTests [
	<CORATestBlacklisted>

	self assert: (self searchTestsForATearDownMethod: SmTClassTest >> #testMethod1) isEmpty.
]

{ #category : #tests }
SmTFinderAbstractTest >> testTestSelfSelected [
	<CORATestBlacklisted>
	| testsFound | 
	testsFound := self searchTestsForATestMethod: SmTClassTest >> #testMethod1.

	self assert: (testsFound includes: testMethod1).
	self deny: (testsFound includes: testMethod2).
	self deny: (testsFound includes: testMethod3).
	self deny: (testsFound includes: testMethod4).
]

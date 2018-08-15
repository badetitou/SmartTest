"
This class aims to test the construction of the cache in the context of dynamic method analysis with different dynamic strategies and different cache strategies.
"
Class {
	#name : #SmTCacheBuilderTest,
	#superclass : #TestCase,
	#instVars : [
		'cache',
		'smartFinder'
	],
	#category : 'SmartTest-Tests-CacheBuilder'
}

{ #category : #testing }
SmTCacheBuilderTest class >> isAbstract [

	^ self  == SmTCacheBuilderTest
]

{ #category : #initialization }
SmTCacheBuilderTest >> cacheStrategy [ 
self subclassResponsibility.
]

{ #category : #initialization }
SmTCacheBuilderTest >> dynamicFinder [
	self subclassResponsibility 
]

{ #category : #helpers }
SmTCacheBuilderTest >> searchTestMethodsFor: aCompiledMethod [
	
	^ smartFinder researchTestsForMethod: aCompiledMethod .
]

{ #category : #initialization }
SmTCacheBuilderTest >> setUp [
	smartFinder := SmartFinder new.
	smartFinder filter: SmTDefaultClassPackagesFilter new.
	"the cache is initially empty"
	smartFinder autoUpdateCache: false.
	smartFinder cacheStrategy: self cacheStrategy new.
	smartFinder resetCache.
	smartFinder smtFinder: self dynamicFinder.
	smartFinder autoUpdateCache: true
]

{ #category : #initialization }
SmTCacheBuilderTest >> tearDown [
	smartFinder autoUpdateCache: false.
	smartFinder clean.
	super tearDown
]

{ #category : #tests }
SmTCacheBuilderTest >> testResearchTestsForStandardMethodWhileEmptyCache [
	<CORATestBlacklisted>
	| testsFound |
	self assert: smartFinder currentCache isEmpty.
	testsFound := self searchTestMethodsFor: SmTClass >> #method2.
	self assert: smartFinder currentCache isEmpty.
	self assert: testsFound isEmpty.
	

]

{ #category : #tests }
SmTCacheBuilderTest >> testRunningTestMethod1ToBuildCache [
	<CORATestBlacklisted>
	self assert: smartFinder currentCache isEmpty.
	SmTClassTest run: #testMethod1.
	"Running the test fill the cache that is then no more empty but contains only the association between SmTClass>>method1 and SmTClassTest>>testMethod1"
	self assert: smartFinder currentCache isNotEmpty.
	self assert: smartFinder currentCache size equals: 2.

	"Not sure about the format of the dictionnary."
	self assert: (smartFinder currentCache at: (SmTClass >> #method1) asRingDefinition) equals: {(SmTClassTest >> #testMethod1) asRingDefinition} asSet
]

{ #category : #tests }
SmTCacheBuilderTest >> testRunningTestMethod2ToBuildCache [
	<CORATestBlacklisted>
	self assert: smartFinder currentCache isEmpty.
	SmTClassTest run: #testMethod2.
	"Running the test fills the cache that is then no more empty but contains only the association between SmTClass>>methodi (with i = 1 to 4) and SmTClassTest>>testMethod2. The cache should contain 5 associations one for each method as key and testMethod2 asValue"
	self assert: smartFinder currentCache isNotEmpty.
	self assert: smartFinder currentCache size equals: 5.
	self assert: (smartFinder currentCache at: (SmTClass >> #method1) asRingDefinition) equals: {(SmTClassTest >> #testMethod2) asRingDefinition} asSet.

	"Not sure about the format of the dictionnary."
	self assert: (smartFinder currentCache at: (SmTClass >> #method2) asRingDefinition) equals: {(SmTClassTest >> #testMethod2) asRingDefinition} asSet.
	self assert: (smartFinder currentCache at: (SmTClass >> #method3:) asRingDefinition) equals: {(SmTClassTest >> #testMethod2) asRingDefinition} asSet.
	self assert: (smartFinder currentCache at: (SmTClass >> #method4) asRingDefinition) equals: {(SmTClassTest >> #testMethod2) asRingDefinition} asSet
]

{ #category : #tests }
SmTCacheBuilderTest >> testRunningTestMethod5ToBuildCache [
	"This test if SmTTestCoverage find the initialize call"

	<CORATestBlacklisted>
	self assert: smartFinder currentCache isEmpty.
	SmTClassTest run: #testMethod5.
	"Running the test fill the cache that is then no more empty but contains only the association between SmTClass2>>initialize and SmTClassTest>>testMethod5"
	self assert: smartFinder currentCache isNotEmpty.
	self assert: smartFinder currentCache size equals: 2.
	self assert: (smartFinder currentCache at: (SmTClass2 >> #initialize) asRingDefinition) equals: {(SmTClassTest >> #testMethod5) asRingDefinition} asSet.
	self assert: (smartFinder currentCache at: (SmTClassTest >> #testMethod5) asRingDefinition) equals: {(SmTClassTest >> #testMethod5) asRingDefinition} asSet
]

"
A SmartFinderTest is a test class for testing the behavior of SmartFinder
"
Class {
	#name : #SmartFinderTest,
	#superclass : #TestCase,
	#instVars : [
		'smartFinder'
	],
	#category : #'SmartTest-Tests-Finder'
}

{ #category : #initialization }
SmartFinderTest >> initCache [
	^ {((SmTClass >> #method1 )asRingDefinition
		->
			{(SmTClassTest >> #testMethod1 )asRingDefinition.
			(SmTClassTest >> #testMethod2 )asRingDefinition.
			(RGMethodDefinition className: 'SmTInheritClassTest' selector: #testMethod1 isMetaSide: false)} asSet).
	((SmTClass >> #method2 )asRingDefinition
		->
			{(SmTClassTest >> #testMethod2 )asRingDefinition}
				asSet).
	((SmTClass >> #method3: )asRingDefinition
		->
			{(SmTClassTest >> #testMethod1 )asRingDefinition.
			(SmTClassTest >> #testMethod2 )asRingDefinition.
			(SmTClassTest >> #testMethod3 )asRingDefinition}
				asSet).
	((SmTClass >> #method4 )asRingDefinition
		->
			{(SmTClassTest >> #testMethod2 )asRingDefinition.
			(SmTClassTest >> #testMethod3 )asRingDefinition.
			(SmTClassTest >> #testMethod4 )asRingDefinition}
				asSet).
	((SmTClass2 >> #initialize )asRingDefinition
		->
			{(SmTClassTest >> #testMethod5 )asRingDefinition}
				asSet).
	((SmTClassTest >> #testMethod4 )asRingDefinition
		->
			{(SmTClassTest >> #testMethod4 )asRingDefinition}
				asSet)} asDictionary
]

{ #category : #initialization }
SmartFinderTest >> setUp [
	smartFinder := SmartFinder new
		cacheStrategy: SmTBasicCacheStrategy new;
		filter: SmTNoFilter new;
		testRunner: SmTRunnerStrategyDebug;
		smtFinder: SmTSenderTestFinderStrategy new;
		testingStrategy: SmTTestingStrategyEachModification new;
		shouldTryToFindTestForDynamic: false
]

{ #category : #initialization }
SmartFinderTest >> tearDown [
	smartFinder clean
]

{ #category : #initialization }
SmartFinderTest >> testChangeCacheClassFinder [
	| cacheTmp |
	smartFinder smtFinder.
	cacheTmp := SmTBasicCacheStrategy new.
	smartFinder cacheStrategy: cacheTmp.
	self assert: smartFinder smtFinder cache equals: cacheTmp
]

{ #category : #initialization }
SmartFinderTest >> testChangeFilterFinder [
	| filterTmp |
	smartFinder smtFinder.
	filterTmp := SmTDefaultPackagesFilter new.
	smartFinder filter: filterTmp.
	self assert: smartFinder smtFinder filter equals: filterTmp
]

{ #category : #initialization }
SmartFinderTest >> testChangeFilterTryFindTestFinder [
	smartFinder smtFinder.
	smartFinder shouldTryToFindTestForDynamic: true. 
	self assert: smartFinder smtFinder shouldTryToFindTestForDynamic.
	smartFinder shouldTryToFindTestForDynamic: false.
	self deny: smartFinder smtFinder shouldTryToFindTestForDynamic
]

{ #category : #initialization }
SmartFinderTest >> testChangeFinderTestingStrategy [
	| finderTmp |
	smartFinder testingStrategy.
	finderTmp := SmTSenderTestFinderStrategy new.
	smartFinder smtFinder: finderTmp.
	self assert: smartFinder testingStrategy finder equals: finderTmp
]

{ #category : #initialization }
SmartFinderTest >> testChangeRunnerTestingStrategy [
	smartFinder testingStrategy.
	smartFinder testRunner: SmTRunnerStrategyDebug.
	self assert: smartFinder testingStrategy runner equals: SmTRunnerStrategyDebug.
	smartFinder testRunner: SmTRunnerStrategyNotice.
	self assert: smartFinder testingStrategy runner equals: SmTRunnerStrategyNotice
]

{ #category : #'tests-api' }
SmartFinderTest >> testResetCache [
	self assert: smartFinder currentCache isEmpty .
	smartFinder setCacheValues: self initCache.
	self assert: smartFinder currentCache isNotEmpty .
	smartFinder resetCache.
	self assert: smartFinder currentCache isEmpty 
]

{ #category : #initialization }
SmartFinderTest >> testTwoSmartFinderhaveTwoDifferentCache [
	| smartFinder2 |
	smartFinder2 := SmartFinder new.
	self deny: smartFinder currentCache == smartFinder2 currentCache
]

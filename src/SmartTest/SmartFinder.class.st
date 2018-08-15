"
I'm the boss !!!

I contain the instance of all the stuff the user needs.

If you want to specify some strategy
use it more or less that way (here with the default values)

SmartFinder new
		cache: self cacheStrategy new;
		filter: self filter new;
		testRunner: self testRunner;
		smtFinder: self smtFinder new;
		testingStrategy: self testingStrategy new
"
Class {
	#name : #SmartFinder,
	#superclass : #Object,
	#instVars : [
		'filter',
		'testRunner',
		'testingStrategy',
		'smtFinder',
		'cacheStrategy',
		'shouldTryToFindTestForDynamic',
		'autoUpdateCache',
		'smtListener'
	],
	#category : 'SmartTest-Core'
}

{ #category : #accessing }
SmartFinder >> autoUpdateCache: aBoolean [
	self smtListener cacheStrategy: self cacheStrategy.
	self smtListener smtDynamicFinder: self smtFinder.
	self smtListener class activated: aBoolean
]

{ #category : #api }
SmartFinder >> buildCacheFromTestSuite: aTestSuite [
	"Work only if you have selected a Dynamic strategy"
	self smtFinder buildCacheFromTestSuite: aTestSuite 
]

{ #category : #accessing }
SmartFinder >> cacheStrategy [
	^ cacheStrategy ifNil: [ cacheStrategy := SmTBasicCacheStrategy new cache: Dictionary new ]
]

{ #category : #accessing }
SmartFinder >> cacheStrategy: aSmTCacheStrategy [
	| tmpCache |
	tmpCache := self currentCache.
	cacheStrategy := aSmTCacheStrategy.
	cacheStrategy cache: tmpCache.
	self smtFinder cache: cacheStrategy
]

{ #category : #api }
SmartFinder >> clean [
	"Use before loosing my reference
	I remove the listener"
	self testingStrategy disable
]

{ #category : #api }
SmartFinder >> currentCache [
	^ self cacheStrategy currentCache 
]

{ #category : #accessing }
SmartFinder >> filter [
	^ filter ifNil: [ filter := SmTDefaultPackagesFilter new ]
]

{ #category : #accessing }
SmartFinder >> filter: aSmTDefaultPackagesFilter [
	filter := aSmTDefaultPackagesFilter.
		self smtFinder filter: aSmTDefaultPackagesFilter
]

{ #category : #api }
SmartFinder >> findTestsForMethod: aCompiledMethod [
	"This is the api for QA (use the testing strategy, the rule strategy etc.)
	If you only want to find the tests, please consider using #researchTestsForMethod:"

	^ self testingStrategy findTestsForMethod: aCompiledMethod
]

{ #category : #initialization }
SmartFinder >> initialize [
	 self shouldTryToFindTestForDynamic: false
]

{ #category : #api }
SmartFinder >> researchTestsForMethod: aCompiledMethod [ 
	"If you only want to find the tests"
	^ self smtFinder methodsFor: aCompiledMethod.
]

{ #category : #api }
SmartFinder >> resetCache [
	self cacheStrategy resetCache 
]

{ #category : #api }
SmartFinder >> searchTestsForASetUpMethod: aCompiledMethod [ 
	^ self smtFinder searchTestsForASetUpMethod: aCompiledMethod.
]

{ #category : #api }
SmartFinder >> searchTestsForATearDownMethod: aCompiledMethod [ 
	^ self smtFinder searchTestsForATearDownMethod: aCompiledMethod
]

{ #category : #api }
SmartFinder >> searchTestsForATestMethod: aCompiledMethod [ 
	^ self smtFinder searchTestsForATestMethod: aCompiledMethod
]

{ #category : #api }
SmartFinder >> setCacheValues: aDictionnary [
	self cacheStrategy cache: aDictionnary.
]

{ #category : #accessing }
SmartFinder >> shouldTryToFindTestForDynamic [
	^ shouldTryToFindTestForDynamic
]

{ #category : #accessing }
SmartFinder >> shouldTryToFindTestForDynamic: aBoolean [
	shouldTryToFindTestForDynamic := aBoolean.
	self smtFinder shouldTryToFindTestForDynamic: aBoolean
]

{ #category : #accessing }
SmartFinder >> smtFinder [
	^ smtFinder
		ifNil: [ smtFinder := SmTSenderTestFinderStrategy new
				filter: self filter;
				cache: self cacheStrategy;
				shouldTryToFindTestForDynamic: self shouldTryToFindTestForDynamic;
				yourself  ]
]

{ #category : #accessing }
SmartFinder >> smtFinder: aSmTTestFinderStrategy [
	smtFinder := aSmTTestFinderStrategy.
	smtFinder
		filter: self filter;
		cache: self cacheStrategy;
		shouldTryToFindTestForDynamic: self shouldTryToFindTestForDynamic.
	self testingStrategy finder: aSmTTestFinderStrategy
]

{ #category : #accessing }
SmartFinder >> smtListener [
	^ SmTTestListener uniqueInstance 
]

{ #category : #accessing }
SmartFinder >> testRunner [
	^ testRunner ifNil: [ testRunner := SmTRunnerStrategySmart ]
]

{ #category : #accessing }
SmartFinder >> testRunner: aSmTRunnerStrategy [
	testRunner := aSmTRunnerStrategy.
	self testingStrategy runner: aSmTRunnerStrategy
]

{ #category : #accessing }
SmartFinder >> testingStrategy [
	^ testingStrategy ifNil: [ testingStrategy :=  SmTTestingStrategyEachModification new runner: self testRunner; finder: self smtFinder ]
]

{ #category : #accessing }
SmartFinder >> testingStrategy: aSmTTestingStrategy [
	testingStrategy disable.
	testingStrategy := aSmTTestingStrategy.
	testingStrategy
		runner: self testRunner;
		finder: self smtFinder.
	testingStrategy enable.
]

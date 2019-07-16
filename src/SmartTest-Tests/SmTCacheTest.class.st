"
This tests are here to assert that cache strategies behave corectly.
- BasicCacheNeverReset should always have something in it.
- BasicCacheResetEvery5Changes should reset after 5 calls to its reset method
- BasicCacheResetEveryCommit should reset after each change that is a commit, and not the methods changes.
- BasicCache should reset each time its method reset is called

"
Class {
	#name : #SmTCacheTest,
	#superclass : #TestCase,
	#instVars : [
		'cache',
		'smartFinder'
	],
	#category : #'SmartTest-Tests-Cache'
}

{ #category : #testing }
SmTCacheTest class >> isAbstract [
^ (self == SmTCacheTest)
]

{ #category : #'initialize-release' }
SmTCacheTest >> initCache [
	^ {((SmTClass >> #method1) asRingDefinition
		->
			{(SmTClassTest >> #testMethod1) asRingDefinition.
			(SmTClassTest >> #testMethod2) asRingDefinition.
			(RGMethodDefinition
				className: 'SmTInheritClassTest'
				selector: #testMethod1
				isMetaSide: false)} asSet).
	((SmTClass >> #method2) asRingDefinition
		-> {(SmTClassTest >> #testMethod2) asRingDefinition} asSet).
	((SmTClass >> #method3:) asRingDefinition
		->
			{(SmTClassTest >> #testMethod1) asRingDefinition.
			(SmTClassTest >> #testMethod2) asRingDefinition.
			(SmTClassTest >> #testMethod3) asRingDefinition} asSet).
	((SmTClass >> #method4) asRingDefinition
		->
			{(SmTClassTest >> #testMethod2) asRingDefinition.
			(SmTClassTest >> #testMethod3) asRingDefinition.
			(SmTClassTest >> #testMethod4) asRingDefinition} asSet).
	((SmTClass2 >> #initialize) asRingDefinition
		-> {(SmTClassTest >> #testMethod5) asRingDefinition} asSet).
	((SmTClassTest >> #testMethod4) asRingDefinition
		-> {(SmTClassTest >> #testMethod4) asRingDefinition} asSet).
	((('SmTP1' , 'Inheritance') asClass >> ('method1' , 'Inheritance') asSymbol)
		asRingDefinition
		->
			{(('SmTP1' , 'InheritanceSubClass1Test') asClass >> ('testMethod1','Inheritance') asSymbol)
				asRingDefinition.
			(RGMethodDefinition className: ('SmTP1InheritanceSubClass2','Test') selector:	('testMethod1','Inheritance') isMetaSide:	false)
				asRingDefinition} asSet)} asDictionary
]

{ #category : #running }
SmTCacheTest >> setUp [
	"fill in the cache"

	| initialCache |
	super setUp.
	smartFinder := SmartFinder new.
	initialCache := self initCache.
	smartFinder cacheStrategy: (self strategyTested new).
	smartFinder setCacheValues: initialCache.
	smartFinder smtFinder: SmTTestCoverageTestFinderStrategy new
]

{ #category : #running }
SmTCacheTest >> strategyTested [
self subclassResponsibility 
]

{ #category : #tests }
SmTCacheTest >> testInitCache [
self assert: (smartFinder currentCache isNotEmpty).
]

{ #category : #tests }
SmTCacheTest >> testResetAfter1Commit [
	"After one commit, the cache should be empty for EveryCommit and OnDemand."

	smartFinder cacheStrategy
		emptyCacheForChange: EpMonticelloVersionSave new.
	self assert: smartFinder currentCache isNotEmpty
]

{ #category : #tests }
SmTCacheTest >> testResetAfter1MethodChange [
	"After one method change, the cache should be empty for OnDemand."

	smartFinder cacheStrategy emptyCacheForChange: EpMethodAddition new.
	self assert: smartFinder currentCache isNotEmpty
]

{ #category : #tests }
SmTCacheTest >> testResetAfter4MethodChange [
	"After one method change, the cache should be empty for OnDemand."

	smartFinder cacheStrategy emptyCacheForChange: EpMethodAddition new.
	smartFinder cacheStrategy emptyCacheForChange: EpMethodAddition new.
	smartFinder cacheStrategy emptyCacheForChange: EpMethodAddition new.
	smartFinder cacheStrategy emptyCacheForChange: EpMethodAddition new.
	self assert: smartFinder currentCache isNotEmpty
]

{ #category : #tests }
SmTCacheTest >> testResetAfter5MethodChange [
	"After 5 method change, the cache should be empty for OnDemand and EveryFiveChange."

	smartFinder cacheStrategy emptyCacheForChange: EpMethodAddition new.
	smartFinder cacheStrategy emptyCacheForChange: EpMethodAddition new.
	smartFinder cacheStrategy emptyCacheForChange: EpMethodAddition new.
	smartFinder cacheStrategy emptyCacheForChange: EpMethodAddition new.
	smartFinder cacheStrategy emptyCacheForChange: EpMethodAddition new.
	self assert: smartFinder currentCache isNotEmpty
]

Class {
	#name : #SmTCacheResetEvery5ChangesTest,
	#superclass : #SmTCacheTest,
	#category : #'SmartTest-Tests-Cache'
}

{ #category : #running }
SmTCacheResetEvery5ChangesTest >> strategyTested [
^ SmTBasicCacheResetEvery5ChangesStrategy  
]

{ #category : #tests }
SmTCacheResetEvery5ChangesTest >> testResetAfter5MethodChange [
	"After 5 method change, the cache should be empty for OnDemand and EveryFiveChange."

	smartFinder cacheStrategy emptyCacheForChange: EpMethodAddition new.
	smartFinder cacheStrategy emptyCacheForChange: EpMethodAddition new.
	smartFinder cacheStrategy emptyCacheForChange: EpMethodAddition new.
	smartFinder cacheStrategy emptyCacheForChange: EpMethodAddition new.
	self assert: smartFinder cacheStrategy numberOfChange == 4.
	smartFinder cacheStrategy emptyCacheForChange: EpMethodAddition new.
	self assert: smartFinder cacheStrategy numberOfChange == 0.
	self assert: smartFinder currentCache isEmpty
]

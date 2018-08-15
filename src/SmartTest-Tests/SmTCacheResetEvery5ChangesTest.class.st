Class {
	#name : #SmTCacheResetEvery5ChangesTest,
	#superclass : #SmTCacheTest,
	#category : 'SmartTest-Tests-Cache'
}

{ #category : #running }
SmTCacheResetEvery5ChangesTest >> strategyTested [
^ SmTBasicCacheResetEvery5ChangesStrategy  
]

{ #category : #tests }
SmTCacheResetEvery5ChangesTest >> testResetAfter5MethodChange [
	"After one method change, the cache should be empty for NeverRest, EveryFiveChange, and EveryCommit case."

	smartFinder cacheStrategy resetCacheForChange: EpMethodAddition new.
	smartFinder cacheStrategy resetCacheForChange: EpMethodAddition new.
	smartFinder cacheStrategy resetCacheForChange: EpMethodAddition new.
	smartFinder cacheStrategy resetCacheForChange: EpMethodAddition new.
	self assert: smartFinder cacheStrategy numberOfChange == 4.
	smartFinder cacheStrategy resetCacheForChange: EpMethodAddition new.
	self assert: smartFinder cacheStrategy numberOfChange == 0.
	self assert: smartFinder currentCache isEmpty
]

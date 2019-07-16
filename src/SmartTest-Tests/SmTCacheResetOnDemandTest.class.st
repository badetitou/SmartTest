Class {
	#name : #SmTCacheResetOnDemandTest,
	#superclass : #SmTCacheTest,
	#category : #'SmartTest-Tests-Cache'
}

{ #category : #running }
SmTCacheResetOnDemandTest >> strategyTested [
^ SmTBasicCacheStrategy 
]

{ #category : #tests }
SmTCacheResetOnDemandTest >> testResetAfter1Commit [
	"After one commit, the cache should be empty for EveryCommit and OnDemand."

	smartFinder cacheStrategy
		emptyCacheForChange: EpMonticelloVersionSave new.
	self assert: smartFinder currentCache isEmpty
]

{ #category : #tests }
SmTCacheResetOnDemandTest >> testResetAfter1MethodChange [
	"After one method change, the cache should be empty for OnDemand."

	smartFinder cacheStrategy emptyCacheForChange: EpMethodAddition new.
	self assert: smartFinder currentCache isEmpty
]

{ #category : #tests }
SmTCacheResetOnDemandTest >> testResetAfter4MethodChange [
	"After one method change, the cache should be empty for OnDemand."

	smartFinder cacheStrategy emptyCacheForChange: EpMethodAddition new.
	smartFinder cacheStrategy emptyCacheForChange: EpMethodAddition new.
	smartFinder cacheStrategy emptyCacheForChange: EpMethodAddition new.
	smartFinder cacheStrategy emptyCacheForChange: EpMethodAddition new.
	self assert: smartFinder currentCache isEmpty
]

{ #category : #tests }
SmTCacheResetOnDemandTest >> testResetAfter5MethodChange [
	"After 5 method change, the cache should be empty for OnDemand and EveryFiveChange."

	smartFinder cacheStrategy emptyCacheForChange: EpMethodAddition new.
	smartFinder cacheStrategy emptyCacheForChange: EpMethodAddition new.
	smartFinder cacheStrategy emptyCacheForChange: EpMethodAddition new.
	smartFinder cacheStrategy emptyCacheForChange: EpMethodAddition new.
	smartFinder cacheStrategy emptyCacheForChange: EpMethodAddition new.
	self assert: smartFinder currentCache isEmpty
]

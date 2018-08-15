Class {
	#name : #SmTCacheResetOnDemandTest,
	#superclass : #SmTCacheTest,
	#category : 'SmartTest-Tests-Cache'
}

{ #category : #running }
SmTCacheResetOnDemandTest >> strategyTested [
^ SmTBasicCacheStrategy 
]

{ #category : #tests }
SmTCacheResetOnDemandTest >> testResetAfter1Commit [
"After one method change, the cache should be empty for NeverRest, EveryFiveChange, and EveryCommit case."
smartFinder cacheStrategy resetCacheForChange: EpMonticelloVersionSave new.
self assert: (smartFinder currentCache isEmpty)
]

{ #category : #tests }
SmTCacheResetOnDemandTest >> testResetAfter1MethodChange [
"Here, the cache should be empty because the BasicCache strategy allows that the reset of the cache"
smartFinder cacheStrategy resetCacheForChange: EpMethodAddition new.
self assert: (smartFinder currentCache isEmpty)
]

{ #category : #tests }
SmTCacheResetOnDemandTest >> testResetAfter4MethodChange [
	"After one method change, the cache should be empty for NeverRest, EveryFiveChange, and EveryCommit case."

	smartFinder cacheStrategy resetCacheForChange: EpMethodAddition new.
	smartFinder cacheStrategy resetCacheForChange: EpMethodAddition new.
	smartFinder cacheStrategy resetCacheForChange: EpMethodAddition new.
	smartFinder cacheStrategy resetCacheForChange: EpMethodAddition new.
	self assert: smartFinder currentCache isEmpty
]

{ #category : #tests }
SmTCacheResetOnDemandTest >> testResetAfter5MethodChange [
"After one method change, the cache should be empty for NeverRest, EveryFiveChange, and EveryCommit case."
smartFinder cacheStrategy resetCacheForChange: EpMethodAddition new.
smartFinder cacheStrategy resetCacheForChange: EpMethodAddition new.
smartFinder cacheStrategy resetCacheForChange: EpMethodAddition new.
smartFinder cacheStrategy resetCacheForChange: EpMethodAddition new.
smartFinder cacheStrategy resetCacheForChange: EpMethodAddition new.
self assert: (smartFinder currentCache isEmpty)
]

Class {
	#name : #SmTCacheResetEveryCommitTest,
	#superclass : #SmTCacheTest,
	#category : #'SmartTest-Tests-Cache'
}

{ #category : #running }
SmTCacheResetEveryCommitTest >> strategyTested [
^ SmTBasicCacheResetEveryCommitStrategy 
]

{ #category : #tests }
SmTCacheResetEveryCommitTest >> testResetAfter1Commit [
	"After one commit, the cache should be empty for EveryCommit and OnDemand."

	smartFinder cacheStrategy
		emptyCacheForChange: EpMonticelloVersionSave new.
	self assert: smartFinder currentCache isEmpty
]

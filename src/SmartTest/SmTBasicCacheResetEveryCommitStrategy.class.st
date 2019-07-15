"
This strategy always adds the tests to the cache and always gives the tests when asked.

When using this strategy, the cache is reseted only when a commit is peformed. It is mostly used with SmartTest Experiment. 
"
Class {
	#name : #SmTBasicCacheResetEveryCommitStrategy,
	#superclass : #SmTBasicCacheStrategy,
	#category : #'SmartTest-Cache'
}

{ #category : #private }
SmTBasicCacheResetEveryCommitStrategy >> resetCacheForChange: aChange [
	(aChange isKindOf: EpMonticelloVersionSave) ifTrue:[self emptyCache].
	
]

"
This strategy always adds the tests to the cache and always gives the tests when asked.

When using this strategy, the cache is never reseted, even when told so.
"
Class {
	#name : #SmTBasicCacheNeverResetStrategy,
	#superclass : #SmTBasicCacheStrategy,
	#category : #'SmartTest-Cache'
}

{ #category : #private }
SmTBasicCacheNeverResetStrategy >> resetCache [
	"Never reset the cache for this strategy."
]

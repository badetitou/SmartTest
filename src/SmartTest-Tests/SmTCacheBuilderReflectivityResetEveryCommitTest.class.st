"
These tests are here to assert that the build cache methods are correct when dealing the Reflectivity strategy and the reset every commit cache.
"
Class {
	#name : #SmTCacheBuilderReflectivityResetEveryCommitTest,
	#superclass : #SmTCacheBuilderReflectivityTest,
	#category : #'SmartTest-Tests-CacheBuilder'
}

{ #category : #initialization }
SmTCacheBuilderReflectivityResetEveryCommitTest >> cacheStrategy [
^ SmTBasicCacheNeverResetStrategy 
]

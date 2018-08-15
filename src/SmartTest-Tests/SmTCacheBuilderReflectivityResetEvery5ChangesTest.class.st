"
These tests are here to assert that the build cache methods are correct when dealing the Reflectivity strategy and the reset every 5 changes cache.
"
Class {
	#name : #SmTCacheBuilderReflectivityResetEvery5ChangesTest,
	#superclass : #SmTCacheBuilderReflectivityTest,
	#category : 'SmartTest-Tests-CacheBuilder'
}

{ #category : #initialization }
SmTCacheBuilderReflectivityResetEvery5ChangesTest >> cacheStrategy [
^ SmTBasicCacheNeverResetStrategy 
]

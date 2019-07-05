"
These tests are here to assert that the build cache methods are correct when dealing the Reflectivity strategy and the reset on demand cache.
"
Class {
	#name : #SmTCacheBuilderReflectivityResetOnDemandTest,
	#superclass : #SmTCacheBuilderReflectivityTest,
	#category : #'SmartTest-Tests-CacheBuilder'
}

{ #category : #initialization }
SmTCacheBuilderReflectivityResetOnDemandTest >> cacheStrategy [ 
^ SmTBasicCacheStrategy 
]

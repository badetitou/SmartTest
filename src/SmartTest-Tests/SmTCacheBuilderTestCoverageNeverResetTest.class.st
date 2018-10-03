"
These tests are here to assert that the build cache methods are correct when dealing the Test Coverage strategy and the never reset cache.
"
Class {
	#name : #SmTCacheBuilderTestCoverageNeverResetTest,
	#superclass : #SmTCacheBuilderTestCoverageTest,
	#category : #'SmartTest-Tests-CacheBuilder'
}

{ #category : #initialization }
SmTCacheBuilderTestCoverageNeverResetTest >> cacheStrategy [
^ SmTBasicCacheNeverResetStrategy 
]

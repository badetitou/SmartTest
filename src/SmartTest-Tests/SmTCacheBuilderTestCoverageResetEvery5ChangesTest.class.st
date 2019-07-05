"
These tests are here to assert that the build cache methods are correct when dealing the Test Coverage strategy and the reset every 5 changes cache.
"
Class {
	#name : #SmTCacheBuilderTestCoverageResetEvery5ChangesTest,
	#superclass : #SmTCacheBuilderTestCoverageTest,
	#category : #'SmartTest-Tests-CacheBuilder'
}

{ #category : #initialization }
SmTCacheBuilderTestCoverageResetEvery5ChangesTest >> cacheStrategy [
^ SmTBasicCacheResetEvery5ChangesStrategy 
]

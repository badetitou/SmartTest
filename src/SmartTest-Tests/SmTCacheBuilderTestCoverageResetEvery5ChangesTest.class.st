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

{ #category : #accessing }
SmTCacheBuilderTestCoverageResetEvery5ChangesTest >> methodAbsentInCache [
	^ {(SmTClassTest >> #testMethod2) asRingDefinition} asSet
]

{ #category : #accessing }
SmTCacheBuilderTestCoverageResetEvery5ChangesTest >> methodPresentInCache [
	^ (SmTClass >> #method1) asRingDefinition
]

{ #category : #accessing }
SmTCacheBuilderTestCoverageResetEvery5ChangesTest >> testsInCache [
	^ {(SmTClassTest >> #testMethod1) asRingDefinition} asSet
]

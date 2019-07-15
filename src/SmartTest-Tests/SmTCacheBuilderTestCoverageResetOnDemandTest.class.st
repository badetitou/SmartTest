"
These tests are here to assert that the build cache methods are correct when dealing the Test Coverage strategy and the reset on demand cache.
"
Class {
	#name : #SmTCacheBuilderTestCoverageResetOnDemandTest,
	#superclass : #SmTCacheBuilderTestCoverageTest,
	#category : #'SmartTest-Tests-CacheBuilder'
}

{ #category : #initialization }
SmTCacheBuilderTestCoverageResetOnDemandTest >> cacheStrategy [ 
^ SmTBasicCacheStrategy 
]

{ #category : #accessing }
SmTCacheBuilderTestCoverageResetOnDemandTest >> methodAbsentInCache [
	^ {(SmTClassTest >> #testMethod1) asRingDefinition} asSet
]

{ #category : #accessing }
SmTCacheBuilderTestCoverageResetOnDemandTest >> methodPresentInCache [
	^ (SmTClass >> #method2) asRingDefinition
]

{ #category : #accessing }
SmTCacheBuilderTestCoverageResetOnDemandTest >> testsInCache [
	^ {(SmTClassTest >> #testMethod2) asRingDefinition} asSet
]

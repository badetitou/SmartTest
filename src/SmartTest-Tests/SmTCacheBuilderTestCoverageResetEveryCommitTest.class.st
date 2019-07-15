"
These tests are here to assert that the build cache methods are correct when dealing the Test Coverage strategy and the reset every commits cache.
"
Class {
	#name : #SmTCacheBuilderTestCoverageResetEveryCommitTest,
	#superclass : #SmTCacheBuilderTestCoverageTest,
	#category : #'SmartTest-Tests-CacheBuilder'
}

{ #category : #initialization }
SmTCacheBuilderTestCoverageResetEveryCommitTest >> cacheStrategy [
^ SmTBasicCacheResetEveryCommitStrategy 
]

{ #category : #accessing }
SmTCacheBuilderTestCoverageResetEveryCommitTest >> methodAbsentInCache [
	^ {(SmTClassTest >> #testMethod2) asRingDefinition} asSet
]

{ #category : #accessing }
SmTCacheBuilderTestCoverageResetEveryCommitTest >> methodPresentInCache [
	^ (SmTClass >> #method1) asRingDefinition
]

{ #category : #accessing }
SmTCacheBuilderTestCoverageResetEveryCommitTest >> testsInCache [
	^ {(SmTClassTest >> #testMethod1) asRingDefinition} asSet
]

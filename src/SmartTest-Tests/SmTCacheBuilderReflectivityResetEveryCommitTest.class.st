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
	^ SmTBasicCacheResetEveryCommitStrategy
]

{ #category : #accessing }
SmTCacheBuilderReflectivityResetEveryCommitTest >> methodAbsentInCache [
	^ {(SmTClassTest >> #testMethod2) asRingDefinition} asSet
]

{ #category : #accessing }
SmTCacheBuilderReflectivityResetEveryCommitTest >> methodPresentInCache [
	^ (SmTClass >> #method1) asRingDefinition
]

{ #category : #accessing }
SmTCacheBuilderReflectivityResetEveryCommitTest >> testsInCache [
	^ {(SmTClassTest >> #testMethod1) asRingDefinition} asSet
]

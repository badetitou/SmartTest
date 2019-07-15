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

{ #category : #accessing }
SmTCacheBuilderReflectivityResetOnDemandTest >> methodAbsentInCache [
	^ {(SmTClassTest >> #testMethod1) asRingDefinition} asSet
]

{ #category : #accessing }
SmTCacheBuilderReflectivityResetOnDemandTest >> methodPresentInCache [
	^ (SmTClass >> #method2) asRingDefinition
]

{ #category : #accessing }
SmTCacheBuilderReflectivityResetOnDemandTest >> testsInCache [
	^ {(SmTClassTest >> #testMethod2) asRingDefinition} asSet
]

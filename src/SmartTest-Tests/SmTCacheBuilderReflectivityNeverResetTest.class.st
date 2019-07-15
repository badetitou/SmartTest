"
These tests are here to assert that the build cache methods are correct when dealing the Reflectivity strategy and the never reset cache.
"
Class {
	#name : #SmTCacheBuilderReflectivityNeverResetTest,
	#superclass : #SmTCacheBuilderReflectivityTest,
	#category : #'SmartTest-Tests-CacheBuilder'
}

{ #category : #initialization }
SmTCacheBuilderReflectivityNeverResetTest >> cacheStrategy [
^ SmTBasicCacheNeverResetStrategy 
]

{ #category : #accessing }
SmTCacheBuilderReflectivityNeverResetTest >> methodAbsentInCache [
	^ {(SmTClassTest >> #testMethod2) asRingDefinition} asSet
]

{ #category : #accessing }
SmTCacheBuilderReflectivityNeverResetTest >> methodPresentInCache [
	^ (SmTClass >> #method1) asRingDefinition
]

{ #category : #accessing }
SmTCacheBuilderReflectivityNeverResetTest >> testsInCache [
	^ {(SmTClassTest >> #testMethod1) asRingDefinition} asSet
]

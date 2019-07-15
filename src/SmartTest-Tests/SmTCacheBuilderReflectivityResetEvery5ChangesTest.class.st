"
These tests are here to assert that the build cache methods are correct when dealing the Reflectivity strategy and the reset every 5 changes cache.
"
Class {
	#name : #SmTCacheBuilderReflectivityResetEvery5ChangesTest,
	#superclass : #SmTCacheBuilderReflectivityTest,
	#category : #'SmartTest-Tests-CacheBuilder'
}

{ #category : #initialization }
SmTCacheBuilderReflectivityResetEvery5ChangesTest >> cacheStrategy [
^ SmTBasicCacheNeverResetStrategy 
]

{ #category : #accessing }
SmTCacheBuilderReflectivityResetEvery5ChangesTest >> methodAbsentInCache [
	^ {(SmTClassTest >> #testMethod2) asRingDefinition} asSet
]

{ #category : #accessing }
SmTCacheBuilderReflectivityResetEvery5ChangesTest >> methodPresentInCache [
	^ (SmTClass >> #method1) asRingDefinition
]

{ #category : #accessing }
SmTCacheBuilderReflectivityResetEvery5ChangesTest >> testsInCache [
	^ {(SmTClassTest >> #testMethod1) asRingDefinition} asSet
]

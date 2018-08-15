"
These tests are here to assert that the build cache methods are correct when dealing with different cache strategies and the Reflectivity strategy.
"
Class {
	#name : #SmTCacheBuilderReflectivityTest,
	#superclass : #SmTCacheBuilderTest,
	#category : 'SmartTest-Tests-CacheBuilder'
}

{ #category : #testing }
SmTCacheBuilderReflectivityTest class >> isAbstract [
	^ self == SmTCacheBuilderReflectivityTest
]

{ #category : #tests }
SmTCacheBuilderReflectivityTest >> dynamicFinder [
	^ SmTReflectivityTestFinderStrategy new
]

{ #category : #tests }
SmTCacheBuilderReflectivityTest >> testRunningTestMethod1ToBuildCache [
	<CORATestBlacklisted>
	self assert: smartFinder currentCache isEmpty.
	SmTClassTest run: #testMethod1.
	"Running the test fill the cache that is then no more empty but contains only the association between SmTClass>>method1 and SmTClassTest>>testMethod1"
	self assert: smartFinder currentCache isNotEmpty.

	"Not sure about the format of the dictionnary."
	self
		assert: (smartFinder currentCache at: ((SmTClass >> #method1) asRingDefinition ))
		equals: {(SmTClassTest >> #testMethod1) asRingDefinition } asSet
]

{ #category : #tests }
SmTCacheBuilderReflectivityTest >> testRunningTestMethod2ToBuildCache [
	<CORATestBlacklisted>
	self assert: smartFinder currentCache isEmpty.
	SmTClassTest run: #testMethod2.
	self assert: smartFinder currentCache isNotEmpty.
	self
		assert:
			(smartFinder currentCache
				at: (SmTClass >> #method1 )asRingDefinition)
		equals:
			{(SmTClassTest >> #testMethod2 )asRingDefinition}
				asSet.

	"Not sure about the format of the dictionnary."
	self
		assert:
			(smartFinder currentCache
				at: (SmTClass >> #method2 )asRingDefinition)
		equals:
			{(SmTClassTest >> #testMethod2 )asRingDefinition}
				asSet.
	self
		assert:
			(smartFinder currentCache
				at: (SmTClass >> #method3: )asRingDefinition)
		equals:
			{(SmTClassTest >> #testMethod2 )asRingDefinition}
				asSet.
	self
		assert:
			(smartFinder currentCache
				at: (SmTClass >> #method4 )asRingDefinition)
		equals:
			{(SmTClassTest >> #testMethod2 )asRingDefinition}
				asSet
]

{ #category : #tests }
SmTCacheBuilderReflectivityTest >> testRunningTestMethod5ToBuildCache [
	"This test if SmTTestCoverage find the initialize call"

	<CORATestBlacklisted>
	self assert: smartFinder currentCache isEmpty.
	SmTClassTest run: #testMethod5.
	"Running the test fill the cache that is then no more empty but contains only the association between SmTClass>>method1 and SmTClassTest>>testMethod1"
	self assert: smartFinder currentCache isNotEmpty.
	self assert: (smartFinder currentCache at: (SmTClass2 >> #initialize) asRingDefinition) equals: {(SmTClassTest >> #testMethod5) asRingDefinition} asSet.
	self assert: (smartFinder currentCache at: (SmTClassTest >> #testMethod5) asRingDefinition) equals: {(SmTClassTest >> #testMethod5) asRingDefinition} asSet
]

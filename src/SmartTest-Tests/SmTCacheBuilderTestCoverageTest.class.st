"
These tests are here to assert that the build cache methods are correct when dealing with different cache strategies.
"
Class {
	#name : #SmTCacheBuilderTestCoverageTest,
	#superclass : #SmTCacheBuilderTest,
	#category : #'SmartTest-Tests-CacheBuilder'
}

{ #category : #testing }
SmTCacheBuilderTestCoverageTest class >> isAbstract [
^ self == SmTCacheBuilderTestCoverageTest
]

{ #category : #initialization }
SmTCacheBuilderTestCoverageTest >> dynamicFinder [
	^ SmTTestCoverageTestFinderStrategy new
]

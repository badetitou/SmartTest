"
This strategy never adds the tests found to the cache.
"
Class {
	#name : #SmTNoCacheStrategy,
	#superclass : #SmTCacheStrategy,
	#category : #'SmartTest-Cache'
}

{ #category : #accessing }
SmTNoCacheStrategy >> at: aMethodReference [
	^ Set new
]

{ #category : #accessing }
SmTNoCacheStrategy >> at: aCompiled ifAbsent: aBlock [
	^ aBlock value
]

{ #category : #accessing }
SmTNoCacheStrategy >> at: aMethodReference ifPresent: aPresentBlock [
	^ nil
]

{ #category : #accessing }
SmTNoCacheStrategy >> at: key ifPresent: aPresentBlock ifAbsent: anAbsentBlock [
	^ anAbsentBlock value
]

{ #category : #accessing }
SmTNoCacheStrategy >> at: aMethodReference put: aCacheElement [
	^ self 
]

{ #category : #accessing }
SmTNoCacheStrategy >> cache: aDictionary [
	^ self
]

{ #category : #accessing }
SmTNoCacheStrategy >> currentCache [
	^ Dictionary new
]

{ #category : #private }
SmTNoCacheStrategy >> relevantTestsFor: aCompiledMethod [
	^ Set new
]

{ #category : #private }
SmTNoCacheStrategy >> searchTestsForMethodReference: aMethodReference [
	^ Set new
]

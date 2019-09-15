"
This strategy always adds the tests to the cache and always gives the tests when asked.
"
Class {
	#name : #SmTBasicCacheStrategy,
	#superclass : #SmTCacheStrategy,
	#category : #'SmartTest-Cache'
}

{ #category : #accessing }
SmTBasicCacheStrategy >> at: aMethodReference [
	^ self currentCache at: aMethodReference 
]

{ #category : #accessing }
SmTBasicCacheStrategy >> at: methodReference ifAbsent: aBlock [
	^ self currentCache at: methodReference ifAbsent: aBlock
]

{ #category : #accessing }
SmTBasicCacheStrategy >> at: key ifPresent: aPresentBlock [
	^ self currentCache at: key ifPresent: aPresentBlock
]

{ #category : #accessing }
SmTBasicCacheStrategy >> at: key ifPresent: aPresentBlock ifAbsent: anAbsentBlock [
	^ self currentCache at: key ifPresent: aPresentBlock ifAbsent: anAbsentBlock
]

{ #category : #accessing }
SmTBasicCacheStrategy >> at: aMethodReference put: aCacheElement [
	^ self currentCache at: aMethodReference put: aCacheElement 
]

{ #category : #accessing }
SmTBasicCacheStrategy >> currentCache [
	^ cache
]

{ #category : #private }
SmTBasicCacheStrategy >> relevantTestsFor: aCompiledMethod [
	^ self currentCache at: aCompiledMethod methodReference ifAbsentPut: [ Set new ]
]

{ #category : #private }
SmTBasicCacheStrategy >> searchTestsForMethodReference: aMethodReference [
	^ self currentCache at: aMethodReference ifAbsentPut: [ Set new ]
]

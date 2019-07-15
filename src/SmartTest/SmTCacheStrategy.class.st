"
This setting defines how the cache should behave.
"
Class {
	#name : #SmTCacheStrategy,
	#superclass : #Object,
	#instVars : [
		'cache'
	],
	#category : #'SmartTest-Cache'
}

{ #category : #accessing }
SmTCacheStrategy >> at: aMethodReference [
	self subclassResponsibility 
]

{ #category : #accessing }
SmTCacheStrategy >> at: aCompiledMethod ifAbsent: aBlock [
	^ self subclassResponsibility 
]

{ #category : #accessing }
SmTCacheStrategy >> at: key ifPresent: aPresentBlock [
	self subclassResponsibility 
]

{ #category : #accessing }
SmTCacheStrategy >> at: key ifPresent: aPresentBlock ifAbsent: anAbsentBlock [
	self subclassResponsibility 
]

{ #category : #accessing }
SmTCacheStrategy >> at: aMethodReference put: aCacheElement [
	self subclassResponsibility 
]

{ #category : #accessing }
SmTCacheStrategy >> cache: aDictionary [
	cache := aDictionary 
]

{ #category : #accessing }
SmTCacheStrategy >> currentCache [
	self subclassResponsibility 
]

{ #category : #private }
SmTCacheStrategy >> disable [
	"If you need something to work"

	
]

{ #category : #private }
SmTCacheStrategy >> emptyCache [
	cache removeAll
]

{ #category : #private }
SmTCacheStrategy >> enable [
	"If you need something to work"
]

{ #category : #private }
SmTCacheStrategy >> relevantTestsFor: aCompiledMethod [
	self subclassResponsibility
]

{ #category : #private }
SmTCacheStrategy >> resetCacheForChange: aChange [
self emptyCache 
]

{ #category : #private }
SmTCacheStrategy >> searchTestsForMethodReference: aMethodReference [
	self subclassResponsibility 
]

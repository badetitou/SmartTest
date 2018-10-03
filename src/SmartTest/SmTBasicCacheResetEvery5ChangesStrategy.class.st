"
This strategy always adds the tests to the cache and always gives the tests when asked.

When using this strategy, the cache is reseted each 5 changes (changes manageable by SmartTest, for exemple changes on methods and classes). 
"
Class {
	#name : #SmTBasicCacheResetEvery5ChangesStrategy,
	#superclass : #SmTBasicCacheStrategy,
	#instVars : [
		'numberOfChange'
	],
	#category : #'SmartTest-Cache'
}

{ #category : #initialization }
SmTBasicCacheResetEvery5ChangesStrategy >> initialize [
self numberOfChange: 0.
]

{ #category : #accessing }
SmTBasicCacheResetEvery5ChangesStrategy >> numberOfChange [
	^ numberOfChange
]

{ #category : #accessing }
SmTBasicCacheResetEvery5ChangesStrategy >> numberOfChange: anObject [
	numberOfChange := anObject
]

{ #category : #private }
SmTBasicCacheResetEvery5ChangesStrategy >> resetCache [
	numberOfChange := numberOfChange + 1.
	numberOfChange \\ 5 == 0
		ifTrue: [ cache removeAll. numberOfChange := 0]
]

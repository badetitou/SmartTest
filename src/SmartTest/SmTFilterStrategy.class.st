"
This class is used to define the filter used by SmartTest.
"
Class {
	#name : #SmTFilterStrategy,
	#superclass : #Object,
	#category : #'SmartTest-Filter'
}

{ #category : #asserting }
SmTFilterStrategy >> extractPackagesFrom: aCompiledMethod [
	"Can be implemented to init the filter for a specific research"
]

{ #category : #asserting }
SmTFilterStrategy >> shouldEntityBeFilteredOut: anEntity inPackages: anObject [
	self subclassResponsibility 
]

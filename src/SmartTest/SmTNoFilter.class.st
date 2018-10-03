"
This filter is ""useless"" because it does not filter anything: it looks everywhere in the image
"
Class {
	#name : #SmTNoFilter,
	#superclass : #SmTFilterStrategy,
	#category : #'SmartTest-Filter'
}

{ #category : #asserting }
SmTNoFilter >> shouldEntityBeFilteredOut: anEntity inPackages: anObject [
	"(anEntity methodClass allCallsOn collect: #ciPackage) not."

	^ false
]

accessing
testsForMethodReference: aMethodReference
	^ self methodsToTests at: aMethodReference ifAbsentPut: [ Set new ]
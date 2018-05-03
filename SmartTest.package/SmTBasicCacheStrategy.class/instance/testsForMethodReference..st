private
testsForMethodReference: aMethodReference
	^ self currentCache at: aMethodReference ifAbsentPut: [ Set new ]
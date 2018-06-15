private
searchTestsForMethodReference: aMethodReference
	^ self currentCache at: aMethodReference ifAbsentPut: [ Set new ]
private
relevantTestsFor: aCompiledMethod
	^ self currentCache at: aCompiledMethod methodReference ifAbsentPut: [ Set new ]
instance creation
findTestsForClass: aClass
	| aCollectionOfCompiledTest |
	aCollectionOfCompiledTest :=  self findTestsForMethods: (self methodUsingVariablesOfClass: aClass).
	^tests := aCollectionOfCompiledTest 
instance creation
forClass: aClass
	| aCollectionOfCompiledTest |
	aCollectionOfCompiledTest :=  self forMethods: (self methodUsingVariablesOfClass: aClass).
	^tests := aCollectionOfCompiledTest 
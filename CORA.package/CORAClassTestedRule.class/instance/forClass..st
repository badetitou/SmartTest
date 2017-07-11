instance creation
forClass: aClass
	| aCollectionOfCompiledTest |
	aCollectionOfCompiledTest :=  self forMethods: (aClass classLayout allVisibleSlots flatCollect: #usingMethods).
	aCollectionOfCompiledTest addAll:( self forMethods: ((aClass classVariables flatCollect: #usingMethods) collect: #compiledMethod)).
	^tests := aCollectionOfCompiledTest 
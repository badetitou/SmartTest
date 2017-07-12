as yet unclassified
methodUsingVariablesOfClass: aClass
	| aSet |
	aSet := Set new.
	aSet addAll: (aClass classLayout allVisibleSlots flatCollect: #usingMethods).
	aSet addAll: ((aClass classVariables flatCollect: #usingMethods) collect: #compiledMethod).
	^tests := aSet 
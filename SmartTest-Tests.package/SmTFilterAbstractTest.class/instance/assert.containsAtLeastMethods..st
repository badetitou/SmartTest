helpers
assert: foundMethods containsAtLeastMethods: aCollectionOfStringRepresentedMethod
	| foundMethodsNames |
	foundMethodsNames := foundMethods collect: #asString.
	aCollectionOfStringRepresentedMethod
		do: [ :method | self assert: (foundMethodsNames includes: method) ]
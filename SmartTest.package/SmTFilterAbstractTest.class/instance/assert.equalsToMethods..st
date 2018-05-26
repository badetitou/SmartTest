helpers
assert: foundMethods equalsToMethods: aCollectionOfStringRepresentedMethod
	self
		assert: (foundMethods collect: #asString)
		equals: aCollectionOfStringRepresentedMethod asSet
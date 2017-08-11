announcement handling
addInCollectorRelativeTestTo: compiledMethod
	self collector addTestMethods: (CORAFinderSettings finder new methodsFor: compiledMethod)
accessing
isCompiledMethod: receiverCompiledMethod alreadyExploredForTest: testInstance
	self methodToTest
		at: receiverCompiledMethod methodReference
		ifPresent: [ :aSetOfTestInstance | ^ aSetOfTestInstance includes: testInstance ]
		ifAbsent: [ ^ false ]
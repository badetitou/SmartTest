accessing
isCompiledMethod: receiverCompiledMethod alreadyExploredForTest: testInstance
	self methodToTest
		at: receiverCompiledMethod methodReference
		ifPresent: [ :aSetOfTestInstance | ^ aSetOfTestInstance includes: (testInstance class >> testInstance selector) methodReference  ]
		ifAbsent: [ ^ false ]
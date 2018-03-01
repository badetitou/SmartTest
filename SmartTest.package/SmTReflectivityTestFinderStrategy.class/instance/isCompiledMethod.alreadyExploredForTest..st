accessing
isCompiledMethod: receiverCompiledMethod alreadyExploredForTest: testInstance
	self cache
		at: receiverCompiledMethod methodReference
		ifPresent: [ :aSetOfTestInstance | ^ aSetOfTestInstance includes: (testInstance class >> testInstance selector) methodReference  ]
		ifAbsent: [ ^ false ]
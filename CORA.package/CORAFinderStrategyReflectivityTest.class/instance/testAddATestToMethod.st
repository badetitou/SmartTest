tests-accessing
testAddATestToMethod
	<CORATestBlacklisted>
	| strategy methodReference |
	methodReference := (CORARunnerTest >> #noop) methodReference.
	strategy := CORAReflectivityTestFinderStrategy new.
	strategy addATest: #aTest toMethod: CORARunnerTest >> #noop.
	strategy addATest: #aTest2 toMethod: CORARunnerTest >> #noop.
	
	self assert: ((strategy methodToTest at: methodReference) includes: #aTest).
	self assert: ((strategy methodToTest at: methodReference) includes: #aTest2)
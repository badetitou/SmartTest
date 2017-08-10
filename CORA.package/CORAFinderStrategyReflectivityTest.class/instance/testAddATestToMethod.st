tests-accessing
testAddATestToMethod
	<CORATestBlacklisted>
	| strategy methodReference test1 test2 |
	test1 := CORAFinderStrategyReflectivityTest >>#testAddATestToMethod.
	test2 := CORAFinderStrategyReflectivityTest >>#testMethodToTest.
	
	methodReference := (CORARunnerTest >> #noop) methodReference.
	strategy := CORAReflectivityTestFinderStrategy new.
	strategy addATest: (test1 methodClass selector: test1 selector) toMethod: CORARunnerTest >> #noop.
	strategy addATest: (test2 methodClass selector: test2 selector) toMethod: CORARunnerTest >> #noop.
	
	self assert: ((strategy methodToTest at: methodReference) includes: test1 methodReference).
	self assert: ((strategy methodToTest at: methodReference) includes: test2 methodReference)
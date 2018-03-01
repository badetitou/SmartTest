tests-accessing
testAddATestToMethod
	<CORATestBlacklisted>
	| strategy methodReference test1 test2 |
	test1 := SmTFinderStrategyReflectivityTest >>#testAddATestToMethod.
	test2 := SmTFinderStrategyReflectivityTest >>#testMethodToTest.
	
	methodReference := (SmTRunnerTest >> #noop) methodReference.
	strategy := SmTReflectivityTestFinderStrategy new.
	strategy addATest: (test1 methodClass selector: test1 selector) toMethod: SmTRunnerTest >> #noop.
	strategy addATest: (test2 methodClass selector: test2 selector) toMethod: SmTRunnerTest >> #noop.
	
	self assert: ((strategy cache at: methodReference) includes: test1 methodReference).
	self assert: ((strategy cache at: methodReference) includes: test2 methodReference)
tests
testRunningTestMethod2ToBuildCache
	<CORATestBlacklisted>
	self assert: smartFinder currentCache isEmpty.
	SmTClassTest run: #testMethod2.
	"Running the test fills the cache that is then no more empty but contains only the association between SmTClass>>methodi (with i = 1 to 4) and SmTClassTest>>testMethod2. The cache should contain 5 associations one for each method as key and testMethod2 asValue"
	self assert: smartFinder currentCache isNotEmpty.
	self assert: smartFinder currentCache size equals: 5.
	self assert: (smartFinder currentCache at: (SmTClass >> #method1) asRingDefinition) equals: {(SmTClassTest >> #testMethod2) asRingDefinition} asSet.

	"Not sure about the format of the dictionnary."
	self assert: (smartFinder currentCache at: (SmTClass >> #method2) asRingDefinition) equals: {(SmTClassTest >> #testMethod2) asRingDefinition} asSet.
	self assert: (smartFinder currentCache at: (SmTClass >> #method3:) asRingDefinition) equals: {(SmTClassTest >> #testMethod2) asRingDefinition} asSet.
	self assert: (smartFinder currentCache at: (SmTClass >> #method4) asRingDefinition) equals: {(SmTClassTest >> #testMethod2) asRingDefinition} asSet
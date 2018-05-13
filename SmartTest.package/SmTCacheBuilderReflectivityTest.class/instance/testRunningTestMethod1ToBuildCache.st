initialization
testRunningTestMethod1ToBuildCache
	<CORATestBlacklisted>
	self assert: smartFinder currentCache isEmpty.
	SmTClassTest run: #testMethod1.
	"Running the test fill the cache that is then no more empty but contains only the association between SmTClass>>method1 and SmTClassTest>>testMethod1"
	self assert: smartFinder currentCache isNotEmpty.

	"Not sure about the format of the dictionnary."
	self
		assert: (smartFinder currentCache at: ((SmTClass >> #method1) asRingDefinition ))
		equals: {(SmTClassTest >> #testMethod1) asRingDefinition } asSet
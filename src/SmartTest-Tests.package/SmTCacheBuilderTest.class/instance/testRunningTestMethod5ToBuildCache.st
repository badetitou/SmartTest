tests
testRunningTestMethod5ToBuildCache
	"This test if SmTTestCoverage find the initialize call"

	<CORATestBlacklisted>
	self assert: smartFinder currentCache isEmpty.
	SmTClassTest run: #testMethod5.
	"Running the test fill the cache that is then no more empty but contains only the association between SmTClass2>>initialize and SmTClassTest>>testMethod5"
	self assert: smartFinder currentCache isNotEmpty.
	self assert: smartFinder currentCache size equals: 2.
	self assert: (smartFinder currentCache at: (SmTClass2 >> #initialize) asRingDefinition) equals: {(SmTClassTest >> #testMethod5) asRingDefinition} asSet.
	self assert: (smartFinder currentCache at: (SmTClassTest >> #testMethod5) asRingDefinition) equals: {(SmTClassTest >> #testMethod5) asRingDefinition} asSet
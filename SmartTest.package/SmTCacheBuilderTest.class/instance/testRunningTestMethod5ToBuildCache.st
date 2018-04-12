tests
testRunningTestMethod5ToBuildCache
	"This test if SmTTestCoverage find the initialize call"

	<CORATestBlacklisted>
	self assert: smartFinder currentCache isEmpty.
	SmTClassTest run: #testMethod5.
	"Running the test fill the cache that is then no more empty but contains only the association between SmTClass>>method1 and SmTClassTest>>testMethod1"
	self assert: smartFinder currentCache isNotEmpty.
	self assert: smartFinder currentCache size equals: 2.

	self
		assert: (smartFinder currentCache at: (RGMethodDefinition className: 'SmTClass2' selector: #initialize isMetaSide: false))
		equals: {(RGMethodDefinition className: 'SmTClassTest' selector: #testMethod5 isMetaSide: false)} asSet.
			self
		assert: (smartFinder currentCache at: (RGMethodDefinition className: 'SmTClassTest' selector: #testMethod5 isMetaSide: false))
		equals: {(RGMethodDefinition className: 'SmTClassTest' selector: #testMethod5 isMetaSide: false)} asSet
tests
testRunningTestMethod5ToBuildCache
	"This test if SmTTestCoverage find the initialize call"

	<CORATestBlacklisted>
	self assert: smartFinder cacheValues isEmpty.
	SmTClassTest run: #testMethod5.
	"Running the test fill the cache that is then no more empty but contains only the association between SmTClass>>method1 and SmTClassTest>>testMethod1"
	self assert: smartFinder cacheValues isNotEmpty.
	self assert: smartFinder cacheValues size equals: 2.

	self
		assert: (smartFinder cacheValues at: (RGMethodDefinition className: 'SmTClass2' selector: #initialize isMetaSide: false))
		equals: {(RGMethodDefinition className: 'SmTClassTest' selector: #testMethod5 isMetaSide: false)} asSet.
			self
		assert: (smartFinder cacheValues at: (RGMethodDefinition className: 'SmTClassTest' selector: #testMethod5 isMetaSide: false))
		equals: {(RGMethodDefinition className: 'SmTClassTest' selector: #testMethod5 isMetaSide: false)} asSet
tests
testRunningTestMethod2ToBuildCache
	<CORATestBlacklisted>
	self assert: smartFinder cacheValues isEmpty.
	SmTClassTest run: #testMethod2.
	"Running the test fill the cache that is then no more empty but contains only the association between SmTClass>>methodi (with i = 1 to 4) and SmTClassTest>>testMethod2. The cache should contain 4 associations one per each method as key and testMethod2 asValue"
	self assert: smartFinder cacheValues isNotEmpty.
	self assert: smartFinder cacheValues size equals: 4.
	
	"Not sure about the format of the dictionnary."
	self assert:
			(smartFinder cacheValues
				includes:
					(RGMethodDefinition className: 'SmTClass' selector: #method1 isMetaSide: false)
						-> {(RGMethodDefinition className: 'SmTClassTest' selector: #testMethod2 isMetaSide: false)} asSet).
	self assert:
			(smartFinder cacheValues
				includes:
					(RGMethodDefinition className: 'SmTClass' selector: #method2 isMetaSide: false)
						-> {(RGMethodDefinition className: 'SmTClassTest' selector: #testMethod2 isMetaSide: false)} asSet).
	self assert:
			(smartFinder cacheValues
				includes:
					(RGMethodDefinition className: 'SmTClass' selector: #method3 isMetaSide: false)
						-> {(RGMethodDefinition className: 'SmTClassTest' selector: #testMethod2 isMetaSide: false)} asSet).
	self assert:
			(smartFinder cacheValues
				includes:
					(RGMethodDefinition className: 'SmTClass' selector: #method4 isMetaSide: false)
						-> {(RGMethodDefinition className: 'SmTClassTest' selector: #testMethod2 isMetaSide: false)} asSet).

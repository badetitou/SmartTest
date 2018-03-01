helpers
testCacheValue
	"reset the cache since the purpose of the test is to check that the cache is correctly built"
	"self skip.
	smartFinder resetCache.
	self assert: smartFinder hasEmptyCache.
	self searchTestMethodsFor: SmTClass >> #method4."
	
	
	
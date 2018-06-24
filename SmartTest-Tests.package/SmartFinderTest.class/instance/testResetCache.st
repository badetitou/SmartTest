tests-api
testResetCache
	self assert: smartFinder currentCache isEmpty .
	smartFinder setCacheValues: self initCache.
	self assert: smartFinder currentCache isNotEmpty .
	smartFinder resetCache.
	self assert: smartFinder currentCache isEmpty 
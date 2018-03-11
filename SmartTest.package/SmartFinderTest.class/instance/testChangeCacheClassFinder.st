initialization
testChangeCacheClassFinder
	| cacheTmp |
	smartFinder smtFinder.
	cacheTmp := SmTBasicCacheStrategy new.
	smartFinder cacheClass: cacheTmp.
	self assert: smartFinder smtFinder cache equals: cacheTmp
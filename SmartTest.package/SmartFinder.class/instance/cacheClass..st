accessing
cacheClass: aSmTCacheStrategy
	| tmpCache |
	tmpCache := self currentCache.
	cacheClass := aSmTCacheStrategy.
	cacheClass cache: tmpCache.
	self smtFinder cache: cacheClass
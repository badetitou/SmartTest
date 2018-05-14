accessing
cacheStrategy: aSmTCacheStrategy
	| tmpCache |
	tmpCache := self currentCache.
	cacheStrategy := aSmTCacheStrategy.
	cacheStrategy cache: tmpCache.
	self smtFinder cache: cacheStrategy
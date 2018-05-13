accessing
cacheStrategy
	^ cacheStrategy ifNil: [ cacheStrategy := SmTBasicCacheStrategy new cache: Dictionary new ]
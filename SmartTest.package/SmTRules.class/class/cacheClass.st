settings
cacheClass
	^ SmTCache ifNil: [ SmTCache := SmTBasicCacheStrategy ]
settings
cache
	^ SmTCache ifNil: [ SmTCache := SmTBasicCacheStrategy ]
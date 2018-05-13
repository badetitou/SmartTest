settings
cacheStrategy
	^ smTCache ifNil: [ smTCache := SmTBasicCacheStrategy ]
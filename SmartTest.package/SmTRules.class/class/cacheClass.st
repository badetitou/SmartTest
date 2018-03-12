settings
cacheClass
	^ smTCache ifNil: [ smTCache := SmTBasicCacheStrategy ]
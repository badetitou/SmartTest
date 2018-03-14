accessing
cacheClass
	^ cacheClass ifNil: [ cacheClass := SmTBasicCacheStrategy new cache: cache ]
accessing
cacheClass
	^ cacheClass ifNil: [ cacheClass := SmTBasicCacheStrategy new ]
accessing
cache
	^ cache ifNil: [ cache := SmTBasicCacheStrategy new ]
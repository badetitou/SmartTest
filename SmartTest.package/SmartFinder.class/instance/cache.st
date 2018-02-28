accessing
cache
	^ cache ifNil: [ cache := SmTCache new ]
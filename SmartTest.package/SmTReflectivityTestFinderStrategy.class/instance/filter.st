accessing
filter
	^ filter ifNil: [ filter := SmTFilterSettings filter new ]
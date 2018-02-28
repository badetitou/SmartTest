accessing
filter
	^ filter ifNil: [ filter := SmTDefaultPackagesFilter new ]
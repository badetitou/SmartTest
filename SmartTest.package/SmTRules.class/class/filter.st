settings
filter
	^ SmTFilter ifNil: [ SmTFilter := SmTDefaultClassPackagesFilter ]
settings
filter
	^ smTFilter ifNil: [ smTFilter := SmTDefaultClassPackagesFilter ]
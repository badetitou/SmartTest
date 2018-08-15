settings
filter
	^ smTFilter ifNil: [ smTFilter := SmTIcebergLoadedPackagesFilter  ]
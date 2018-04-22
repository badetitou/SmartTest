settings
filter
	^ smTFilter ifNil: [ smTFilter := SmTIcebergLoadedPackageFilter  ]
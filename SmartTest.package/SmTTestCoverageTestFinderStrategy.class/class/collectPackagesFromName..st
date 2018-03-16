protocol
collectPackagesFromName: aPackageName
	^ self collectPackageWithBaseName: (self extractPackageBaseName: aPackageName) 
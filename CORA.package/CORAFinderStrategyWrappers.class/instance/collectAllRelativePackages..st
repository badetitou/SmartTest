accessing
collectAllRelativePackages: aByteString
	^ MonticelloRepositoryBrowser allManagers select: [ :a | (self filter parsePackageBaseName: a packageName) = aByteString ]
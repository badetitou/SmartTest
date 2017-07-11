accessing
availableTestMethods
	^ self availableTestPackages flatCollect: [ :aPackage | aPackage methods ]
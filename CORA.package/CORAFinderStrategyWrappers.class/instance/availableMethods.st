accessing
availableMethods
	^ self availablePackages flatCollect: [ :aPackage | aPackage methods ]
accessing
testsForAClass: aClass
	| packagesToLookAt |
	packagesToLookAt := self filter extractPackagesFrom: aClass.
	^ self recursiveSearchForAClass: aClass inPackages: packagesToLookAt
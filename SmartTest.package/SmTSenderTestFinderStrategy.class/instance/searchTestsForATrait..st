accessing
searchTestsForATrait: aTrait
	| packagesToLookAt |
	packagesToLookAt := self filter extractPackagesFromTrait: aTrait.
	^ self recursiveSearchForAClass: aTrait inPackages: packagesToLookAt
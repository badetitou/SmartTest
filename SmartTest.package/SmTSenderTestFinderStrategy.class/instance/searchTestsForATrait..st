accessing
searchTestsForATrait: aTrait
	| packagesToLookAt testsFound|
	testsFound := Set new.
	packagesToLookAt := self filter extractPackagesFrom: aTrait.
	aTrait users do: [:eachClass | testsFound addAll: (self recursiveSearchForAClass: eachClass inPackages: packagesToLookAt)].
	^testsFound 
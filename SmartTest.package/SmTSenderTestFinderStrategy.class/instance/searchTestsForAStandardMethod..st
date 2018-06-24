API
searchTestsForAStandardMethod: aCompiledMethod
	| packagesToLookAt |
	packagesToLookAt := self filter extractPackagesFrom: aCompiledMethod.
	^ (self
		recursiveSearchForAStandardMethod: aCompiledMethod methodReference
		inPackages: packagesToLookAt ) select: #isTestMethod
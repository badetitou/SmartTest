settings
propagateRegexToTestFinder
	self testFinder filter class = SmTSpecifyPackagesNameFilter
		ifTrue: [ self testFinder filter packagesRegex: self packagesRegex ]
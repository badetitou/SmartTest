tests
testChangeRegexSmTSpecifyPackagesNameFilter
	SmTRules filter: SmTSpecifyPackagesNameFilter.
	SmTRules packagesRegex: self dataForTestRegex.
	self assert: SmTRules testFinder filter packagesRegex equals: self dataForTestRegex
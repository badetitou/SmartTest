tests
testChangeRegex
	SmTRules packagesRegex: self dataForTestRegex.
	self assert: SmTRules testFinder filter packagesRegex equals: self dataForTestRegex
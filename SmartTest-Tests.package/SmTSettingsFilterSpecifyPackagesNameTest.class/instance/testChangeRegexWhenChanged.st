running
testChangeRegexWhenChanged
	SmTRules filter: self filterStrategy.
	self assert: SmTRules testFinder filter packagesRegex equals: self dataForTestRegex 
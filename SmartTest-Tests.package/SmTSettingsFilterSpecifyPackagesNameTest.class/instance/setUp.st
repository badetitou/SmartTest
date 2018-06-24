running
setUp
	super setUp.
	oldRegex := SmTRules packagesRegex.
	SmTRules packagesRegex: self dataForTestRegex 
accessing
testsForAStandardMethod: aCompiledMethod

	| dependencies |
	filter := CORAFilterSettings filter new packages: { aCompiledMethod }.	
	dependencies := self recursiveSearchForAStandardMethod: aCompiledMethod withFilter: filter.
	^ dependencies select: #isTestMethod
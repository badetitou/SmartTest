API
testsForAStandardMethod: aCompiledMethod

	| filter dependencies |
	filter := SmTFilterSettings filter new extractPackagesFrom: { aCompiledMethod }.	
	dependencies := Set new.
	self
		recursiveSearchForAStandardMethod: aCompiledMethod
		withFilter: filter
		foundMethods: dependencies.
	^ (dependencies select: #isTestMethod) collect: #methodReference
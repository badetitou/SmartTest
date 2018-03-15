API
testsForAStandardMethod: aCompiledMethod
	| dependencies |
	filter := self filter extractPackagesFrom: {aCompiledMethod}.
	dependencies := Set new.
	self recursiveSearchForAStandardMethod: aCompiledMethod methodReference withFilter: filter foundMethods: dependencies.
	^ dependencies select: #isTestMethod
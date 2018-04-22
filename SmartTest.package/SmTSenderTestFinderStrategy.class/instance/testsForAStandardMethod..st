API
testsForAStandardMethod: aCompiledMethod
	| dependencies |
	filter := self filter extractPackagesFrom: {aCompiledMethod}.
	dependencies := Set new.
	self recursiveSearchForAStandardMethod: aCompiledMethod methodReference foundMethods: dependencies.
	^ dependencies select: #isTestMethod
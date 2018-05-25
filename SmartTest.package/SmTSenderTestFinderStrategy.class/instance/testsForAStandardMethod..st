API
testsForAStandardMethod: aCompiledMethod
	| dependencies packageToLookAt |
	self flag: #TODO.	"Remove dependencies and obtain it by the return of the #recursiveSearchForAStandardMethod: and add packageToLookAt as a parameter"
	packageToLookAt := self filter extractPackagesFrom: aCompiledMethod.
	dependencies := Set new.
	self
		recursiveSearchForAStandardMethod: aCompiledMethod methodReference
		foundMethods: dependencies.
	^ dependencies select: #isTestMethod
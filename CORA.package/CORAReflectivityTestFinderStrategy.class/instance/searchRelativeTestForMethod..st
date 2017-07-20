accessing
searchRelativeTestForMethod: aCompiledMethod
	"Search for only one package and NOT relative others method"

	| methods |
	methods := self methodsInSimilarPackageAs: aCompiledMethod.
	(self collectRelativeTestMethodOfMethods: methods)
		do: [ :aTestMethod | self installLinkAndRunTest: aTestMethod ]
		displayingProgress: [ :aClass | 'Processing ' , aClass asString ]
		every: 1
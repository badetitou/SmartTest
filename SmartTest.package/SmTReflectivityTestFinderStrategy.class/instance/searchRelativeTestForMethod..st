search
searchRelativeTestForMethod: aCompiledMethod
	"Search for only one package and NOT relative others method"

	| methods |

	methods := self methodsInSimilarPackageAs: aCompiledMethod.
	((self collectRelativeTestMethodOfMethods: methods) asOrderedCollection sort: [ :a :b | a printString < b printString ])
		do: [ :aTestMethod | self installLinkAndRunTest: aTestMethod ]
		displayingProgress: [ :aClass | 'Processing ' , aClass asString ]
		every: 1
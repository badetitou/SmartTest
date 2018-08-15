search
searchRelativeTestForMethod: aCompiledMethod
	"Search for only one package and NOT relative others method"
	| methods |
	methods := self methodsInSimilarPackageAs: aCompiledMethod.
	
	wrappers := {(HDTestCoverage on: aCompiledMethod methodReference)} asOrderedCollection.
	wrappers do: [ :each | each install ].
	[
	 
		(self collectRelativeTestMethodOfMethods: methods)
			do: [ :aTestMethod | self addImpactedTestFromWrapper: aTestMethod theTestMethod: wrappers ]
			displayingProgress: [ :aClass | 'Processing ' , aClass asString ]
			every: 1
		
	] ensure: [ wrappers do: [ :each | each uninstall ] ]
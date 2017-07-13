accessing
searchRelativeTestForMethod: aCompiledMethod
	"Search for only one package and NOT relative others method"
	| wrappers methods packages packageBaseName |
	self initializeSearchRelativeTestForMethod: aCompiledMethod.
	packageBaseName := self filter extractCompiledMethodPackageBaseName: aCompiledMethod.
	packages := self collectAllRelativePackages: packageBaseName.
	methods := packages
		flatCollect: [ :aPackage | (SystemNavigation default allClassesInPackageNamed: aPackage packageName) flatCollect: [ :aClass | aClass allMethods ] ].
	wrappers := {(TestCoverage on: aCompiledMethod methodReference)} asOrderedCollection.
	wrappers do: [ :each | each install ].
	[ (self collectRelativeTestMethodOfMethods: methods)
		do: [ :aTestMethod | self addImpactedTestFromWrapper: aTestMethod theTestMethod: wrappers ]
		displayingProgress: [ :aClass | 'Processing ' , aClass asString ]
		every: 1 ]
		ensure: [ wrappers do: [ :each | each uninstall ] ]
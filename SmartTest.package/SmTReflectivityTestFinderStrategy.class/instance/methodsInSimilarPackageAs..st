as yet unclassified
methodsInSimilarPackageAs: aCompiledMethod
		
	| packageBaseName packages |
	packageBaseName := self filter extractCompiledMethodPackageBaseName: aCompiledMethod.
	packages := self collectAllRelativePackages: packageBaseName.
	^ packages
		flatCollect: [ :aPackage | aPackage package correspondingRPackage methods ]
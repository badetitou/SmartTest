asserting
extractPackagesFrom: aCompiledMethod
	"Can be implemented to init the filter for a specific research"

	^ ((IceRepository registry reject: [ :registry | registry name = 'pharo' ]) flatCollect: [ :repository | repository loadedPackages])
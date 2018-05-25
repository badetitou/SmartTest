accessing
extractPackagesFrom: aCompiledMethod
	"This method is supposed to find (in addition of the supermethod) for the compiled method:
		- the packages of the senders of the compiled method
		- the packages that contains at least one method of the compiled method class"

	super extractPackagesFrom: aCompiledMethod.
	packages addAll: (aCompiledMethod methodClass allCallsOn collect: [ :rgMethod | super extractCompiledMethodPackageBaseName: rgMethod compiledMethod ]).
	packages addAll: (aCompiledMethod methodClass extendingPackages collect: [ :aPackage | self extractCompiledMethodPackageBaseName: aPackage ]).
	^ packages
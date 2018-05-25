accessing
extractPackagesFrom: aCompiledMethod
	"This method is supposed to find (in addition of the supermethod) for the compiled method:
		- the packages of the senders of the compiled method
		- the packages that contains at least one method of the compiled method class"

	| packages |
	packages := super extractPackagesFrom: aCompiledMethod.
	aCompiledMethod methodClass allCallsOn do: [ :rgMethod | packages add: (self extractCompiledMethodPackageBaseName: rgMethod compiledMethod) ].
	aCompiledMethod methodClass extendingPackages do: [ :aPackage | packages add: (self extractCompiledMethodPackageBaseName: aPackage) ].
	^ packages
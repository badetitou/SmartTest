accessing
extractPackagesFrom: aCompiledMethod
	"Thid method find:
		- the package of the classes that owned the method
		- the package that contains the method if its an extension"

	| packages |
	packages := {(self extractCompiledMethodPackageBaseName: aCompiledMethod)} asOrderedCollection.
	aCompiledMethod isExtension
		ifTrue: [  (aCompiledMethod package extendedClasses do: [ :aClass | packages add: aClass package name ]) ].
	^ packages
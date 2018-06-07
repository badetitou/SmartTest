accessing
extractPackagesFrom: anEntity
	"Thid method find:
		- the package of the classes that owned the method
		- the package that contains the method if its an extension"

	| packages |
	packages := Set new.
	anEntity isClass
		ifTrue: [ packages add: (self extractClassPackageBaseName: anEntity)]
		ifFalse: [ packages := {(self extractCompiledMethodPackageBaseName: anEntity)} asSet.
			anEntity isExtension
				ifTrue: [ anEntity package extendedClasses do: [ :aClass | packages add: aClass package name ] ] ].
	^ packages
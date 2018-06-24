asserting
shouldEntityBeFiltered: anEntity inPackages: packages
 "(anEntity methodClass allCallsOn collect: #ciPackage) not."
	(anEntity isClass )ifTrue: [^(packages includes: (anEntity package name)) not].
	^ (packages includes: (self extractMethodDefinitionPackageBaseName: anEntity )) not
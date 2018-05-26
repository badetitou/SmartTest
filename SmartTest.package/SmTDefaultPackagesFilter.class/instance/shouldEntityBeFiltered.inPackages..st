asserting
shouldEntityBeFiltered: anEntity inPackages: packages
 "(anEntity methodClass allCallsOn collect: #ciPackage) not."
	^ (packages includes: (self extractMethodDefinitionPackageBaseName: anEntity )) not
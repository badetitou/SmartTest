asserting
shouldEntityBeFiltered: anEntity
 "(anEntity methodClass allCallsOn collect: #ciPackage) not."
	^ (self packages includes: (self parseCompiledMethodPackageBaseName: anEntity )) not
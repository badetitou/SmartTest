accessing
shouldEntityBeFiltered: anEntity inPackages: anObject
 "(anEntity methodClass allCallsOn collect: #ciPackage) not."
	(anEntity isClass) ifTrue:[^ (self packages includes: anEntity category) not].
	^ (self packages includes: anEntity methodClass category) not
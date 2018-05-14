accessing
shouldEntityBeFiltered: anEntity
 "(anEntity methodClass allCallsOn collect: #ciPackage) not."
	^ (self packages includes: anEntity methodClass category) not
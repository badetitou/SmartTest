asserting
shouldEntityBeFilteredOut: anEntity inPackages: anObject
	"(anEntity methodClass allCallsOn collect: #ciPackage) not."

	^ false
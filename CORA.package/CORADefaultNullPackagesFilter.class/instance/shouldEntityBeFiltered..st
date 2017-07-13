asserting
shouldEntityBeFiltered: anEntity
	"(anEntity methodClass allCallsOn collect: #ciPackage) not."

	^ false
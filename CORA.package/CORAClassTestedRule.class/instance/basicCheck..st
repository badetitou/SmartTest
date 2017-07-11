running
basicCheck: anEntity
	^(anEntity isKindOf: Class) and: self isOnNautilusOrCalypso  
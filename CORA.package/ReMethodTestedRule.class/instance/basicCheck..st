running
basicCheck: anEntity
	^(anEntity isKindOf: CompiledMethod ) and: self isOnNautilusOrCalypso  
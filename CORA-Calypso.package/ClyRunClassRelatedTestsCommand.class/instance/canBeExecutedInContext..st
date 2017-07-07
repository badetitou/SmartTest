execution
canBeExecutedInContext: aCriticContext
	(super canBeExecutedInContext: aCriticContext) ifFalse: [ ^false ].
	
	^CORARelativeTestsCritique subclasses includes: aCriticContext selectedCritique class
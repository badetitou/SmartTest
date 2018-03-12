execution
canBeExecutedInContext: aCriticContext

	(super canBeExecutedInDropContext: aCriticContext) ifFalse: [ ^false ].
	
	^SmTRelativeTestsCritique subclasses includes: aCriticContext class
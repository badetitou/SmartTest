execution
canBeExecutedInContext: aCriticContext

	^ (self canBeExecutedInDropContext: aCriticContext) and: [ SmTRelativeTestsCritique subclasses includes: aCriticContext class ]
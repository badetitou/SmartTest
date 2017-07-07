impact computation
impactedTestForChange: aCORAChangeImpactChange
	(aCORAChangeImpactChange entity senders)
		do: [ :referencingEntity | 
			| change |
			change := CORAChangeImpactChange entity: referencingEntity compiledMethod.
			self
				addImpactedEntityFromChange: change;
				addChangeToProcess: change ]
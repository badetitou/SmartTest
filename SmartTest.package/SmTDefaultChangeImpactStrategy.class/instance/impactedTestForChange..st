impact computation
impactedTestForChange: aCORAChangeImpactChange
	(aCORAChangeImpactChange entity senders)
		do: [ :referencingEntity | 
			| change |
			change := SmTChangeImpactChange entity: referencingEntity compiledMethod.
			self
				addImpactedEntityFromChange: change;
				addChangeToProcess: change ]
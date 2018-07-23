accessing
methodRuleStrategy
	^ methodRuleStrategy ifNil: [ methodRuleStrategy := SmTMethodTestedOnModificationRule. methodRuleStrategy enable ]
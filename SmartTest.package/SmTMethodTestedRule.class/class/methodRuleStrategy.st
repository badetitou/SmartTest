accessing
methodRuleStrategy
	^ methodRuleStrategy ifNil: [ methodRuleStrategy := SmTMethodTestedOnModificationRule ]
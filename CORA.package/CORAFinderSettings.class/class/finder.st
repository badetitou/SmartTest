settings-definition
finder 
	^ finder ifNil: [ finder := CORAChangeImpactTestFinderStrategy  ]
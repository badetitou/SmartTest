accessing
changeImpactStrategy
	^ changeImpactStrategy
		ifNil: [ changeImpactStrategy := CORADefaultChangeImpactStrategy ]
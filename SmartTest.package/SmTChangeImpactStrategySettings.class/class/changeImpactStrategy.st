accessing
changeImpactStrategy
	^ changeImpactStrategy ifNil: [ changeImpactStrategy := SmTDefaultChangeImpactStrategy ]
api
doFindTestsForMethod: aCollection 
	
	self
		deprecated: 'Please use #findTestsForMethod: instead'
		transformWith: '`@receiver doFindTestsForMethod: `@statements' -> '`@receiver findTestsForMethod: `@statements'.
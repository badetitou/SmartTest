instance creation
doFindTestsForMethod: aMethod
	self
		deprecated: 'Please use #findTestsForMethod: instead'
		transformWith: '`@receiver doFindTestsForMethod: `@statements' -> '`@receiver findTestsForMethod: `@statements'.
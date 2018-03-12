instance creation
shouldTryToFindTestForDynamic
	^ shouldTryToFindTestForDynamic ifNil: [ shouldTryToFindTestForDynamic := true ]
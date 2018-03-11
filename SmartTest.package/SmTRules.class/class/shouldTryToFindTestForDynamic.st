instance creation
shouldTryToFindTestForDynamic
	^ ShouldTryToFindTestForDynamic ifNil: [ ShouldTryToFindTestForDynamic := true ]
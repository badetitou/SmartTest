initialization
testChangeFilterTryFindTestFinder
	smartFinder smtFinder.
	smartFinder shouldTryToFindTestForDynamic: true.
	self assert: smartFinder smtFinder shouldTryToFindTestForDynamic.
	smartFinder shouldTryToFindTestForDynamic: false.
	self deny: smartFinder smtFinder shouldTryToFindTestForDynamic
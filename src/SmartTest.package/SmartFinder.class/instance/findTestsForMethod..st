api
findTestsForMethod: aCompiledMethod
	"This is the api for QA (use the testing strategy, the rule strategy etc.)
	If you only want to find the tests, please consider using #researchTestsForMethod:"

	^ self testingStrategy findTestsForMethod: aCompiledMethod
API
testsForClassReferenceOf: aCompiledMethod
	"Find all tests in related packages that reference the method's class"
	^ self testsForClass: aCompiledMethod methodClass
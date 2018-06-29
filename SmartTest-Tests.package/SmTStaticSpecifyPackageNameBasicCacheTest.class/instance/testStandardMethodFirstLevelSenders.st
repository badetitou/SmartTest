tests
testStandardMethodFirstLevelSenders
	"Same test as in the superclass, but here there should be only one test found (there are many in the superclass)"

	<CORATestBlacklisted>
	| testsFound |
	testsFound := self searchTestMethodsFor: SmTClass >> #method2.
	self assert: testsFound size equals: 1.
	self assert: (testsFound includes: testMethod2).
	self deny: (testsFound includes: testMethod1).
	self deny: (testsFound includes: testMethod3).
	self deny: (testsFound includes: testMethod4)
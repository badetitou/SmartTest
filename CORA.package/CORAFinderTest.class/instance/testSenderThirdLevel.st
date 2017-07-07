tests
testSenderThirdLevel
	| testsFound aCompiledTest |
	aCompiledTest := self class >> #method3.
	testsFound := CORAFinderStrategyChangeImpact new methodsFor: aCompiledTest.
	self assert: (testsFound includes: self class >> #testMethod1)
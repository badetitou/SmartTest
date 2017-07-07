tests
testSenderSecondLevel
	| testsFound aCompiledTest |
	aCompiledTest := self class >> #method2.
	testsFound := CORAFinderStrategyChangeImpact new methodsFor: aCompiledTest.
	self assert: (testsFound includes: self class >> #testMethod1)
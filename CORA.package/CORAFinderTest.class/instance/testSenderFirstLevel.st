tests
testSenderFirstLevel 
	| testsFound aCompiledTest | 
	aCompiledTest := self class>>#method1.
	testsFound := CORAFinderStrategyChangeImpact new methodsFor: aCompiledTest.
	self assert: (testsFound includes: self class>>#testMethod1)
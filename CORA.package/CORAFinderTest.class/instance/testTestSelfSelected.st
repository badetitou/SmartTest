tests
testTestSelfSelected
	| testsFound aCompiledTest |
	aCompiledTest := self class>>#testTestSelfSelected.
	testsFound := CORAFinderStrategyChangeImpact new methodsFor: aCompiledTest.
	self assert: testsFound size equals: 1.
	self assert: (testsFound includes: self class>>#testTestSelfSelected)
initialization
testStandardMethodThirdLevelSenders
	<CORATestBlacklisted>
	| testsFound | 
	testsFound := self searchTestMethodsFor: SmTClass >> #method4.
	self assert: testsFound size equals: 3.
	self deny: (testsFound includes: (SmTClassTest  >> #testMethod1  )asRingDefinition).
	self assert: (testsFound includes: (SmTClassTest  >> #testMethod2  )asRingDefinition).
	self assert: (testsFound includes: (SmTClassTest  >> #testMethod3  )asRingDefinition).
	self assert: (testsFound includes: (SmTClassTest  >> #testMethod4  )asRingDefinition).
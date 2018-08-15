tests
testModificationOnInitialize
	<CORATestBlacklisted>
	| testsFound |self
		timeLimit:
			35
				seconds.	
					"this one needs more time than the other"
					self flag: 'Takes a very long time'.
	testsFound := self searchTestMethodsFor: SmTClass2 >> #initialize.

	self deny: (testsFound includes: testMethod1).
	self deny: (testsFound includes: testMethod2).
	self deny: (testsFound includes: testMethod3).
	self deny: (testsFound includes: testMethod4).
	self assert: (testsFound includes: testMethod5).
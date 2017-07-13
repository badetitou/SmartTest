tests-accessing
testAddATestToMethod
	| strategy |
	strategy := CORAReflectivityTestFinderStrategy new.
	strategy addATest: #aTest toMethod: #Hello.
	strategy addATest: #aTest2 toMethod: #Hello.
	self assert: ((strategy methodToTest at: #Hello) includes: #aTest).
	self assert: ((strategy methodToTest at: #Hello) includes: #aTest2)
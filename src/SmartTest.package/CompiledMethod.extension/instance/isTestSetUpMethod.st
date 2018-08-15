*SmartTest
isTestSetUpMethod
	^ (self selector = #setUp) 
	   and: [self belongsToTestCase].
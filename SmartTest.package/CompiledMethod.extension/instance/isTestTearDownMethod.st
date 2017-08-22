*SmartTest
isTestTearDownMethod
	^ (self selector = #tearDown) 
	   and:[self belongsToTestCase]. 
*CORA
isTestTearDownMethod
	^ (self selector = #tearDown) 
	   and:[self belongsToTestCase]. 
*SmartTest
isTestMethod 
  	^ 	self belongsToTestCase
		and: [ self methodClass allTestSelectors includes: self selector].
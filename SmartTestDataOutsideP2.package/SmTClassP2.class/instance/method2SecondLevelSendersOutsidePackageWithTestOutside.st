method2
method2SecondLevelSendersOutsidePackageWithTestOutside
	"Data for tests: this method calls a method not from the same package (located in SmartTestDataOutsideP1), 
	this method is called by a test not from the same package (located in SmartTestDataOutsideP1)"
^ ('SmTClass','P1') asClass new method1SecondLevelSendersOutsidePackageWithTestOutside
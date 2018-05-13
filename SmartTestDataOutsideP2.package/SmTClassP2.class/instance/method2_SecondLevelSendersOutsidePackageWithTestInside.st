method2
method2_SecondLevelSendersOutsidePackageWithTestInside
	"Data for tests: this method calls a method not from the same package (located in SmartTestDataOutsideP1), 
	this method is called by a test from the same package"
^ ('SmTClass','P1') asClass new method1_SecondLevelSendersOutsidePackageWithTestInside
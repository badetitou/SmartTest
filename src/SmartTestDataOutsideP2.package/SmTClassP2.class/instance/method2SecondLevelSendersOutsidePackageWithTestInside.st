method2
method2SecondLevelSendersOutsidePackageWithTestInside
	"Data for tests: this method calls a method not from the same package (located in SmartTestDataOutsideP1), 
	this method is called by a test from the same package"
	"In order to be sure that this method does not reference any class, we don't use directly the class but go through their name with a concatenation and then transform them into class"
^ ('SmTClass','P1') asClass new method1SecondLevelSendersOutsidePackageWithTestInside
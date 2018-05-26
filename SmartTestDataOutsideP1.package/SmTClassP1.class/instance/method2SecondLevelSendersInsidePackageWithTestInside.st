method2
method2SecondLevelSendersInsidePackageWithTestInside
	"Data for tests: this method calls a method from the same package, 
	this method is called by a test from the same package"
	"In order to be sure that this method does not reference any class, we don't use directly the class but go through their name with a concatenation and then transform them into class"
^ ('SmTClass','P1') asClass new method1SecondLevelSendersInsidePackageWithTestInside.
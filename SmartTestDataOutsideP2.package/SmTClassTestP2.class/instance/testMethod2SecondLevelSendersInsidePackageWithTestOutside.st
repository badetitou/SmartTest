testMethod2
testMethod2SecondLevelSendersInsidePackageWithTestOutside
	"Data for tests: this method calls a method not from the same package, which itself calls a method. Both are not from the same package as this test (both are located in SmartTestDataOutsideP1)"
	"In order to be sure that this method does not reference any class, we don't use directly the class but go through their name with a concatenation and then transform them into class"
	^ ('SmTClass','P1') asClass new method2SecondLevelSendersInsidePackageWithTestOutside.
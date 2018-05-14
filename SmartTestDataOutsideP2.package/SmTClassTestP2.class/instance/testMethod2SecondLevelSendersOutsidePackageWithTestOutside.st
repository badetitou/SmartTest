testMethod2
testMethod2SecondLevelSendersOutsidePackageWithTestOutside
"Data for tests: this method calls a method from the same package (located in SmartTestDataOutsideP1), which itself calls a method not from the same package (located in SmartTestDataOutsideP1)"
"In order to be sure that this method does not reference any class, we don't use directly the class but go through their name with a concatenation and then transform them into class"
	^ ('SmTClass','P2') asClass new method2SecondLevelSendersOutsidePackageWithTestOutside.
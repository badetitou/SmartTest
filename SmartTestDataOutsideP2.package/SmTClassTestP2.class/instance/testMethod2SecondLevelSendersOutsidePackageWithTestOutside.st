testMethod2
testMethod2SecondLevelSendersOutsidePackageWithTestOutside
"Data for tests: this method calls a method from the same package (located in SmartTestDataOutsideP1), which itself calls a method not from the same package (located in SmartTestDataOutsideP1)"
	^ ('SmTClass','P2') asClass new method2SecondLevelSendersOutsidePackageWithTestOutside.
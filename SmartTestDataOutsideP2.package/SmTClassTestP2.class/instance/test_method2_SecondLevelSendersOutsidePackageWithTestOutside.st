testMethod2
test_method2_SecondLevelSendersOutsidePackageWithTestOutside
"Data for tests: this method calls a method from the same package (located in SmartTestDataOutsideP1), which itself calls a method not from the same package (located in SmartTestDataOutsideP1)"
	^ ('SmTClass','P2') asClass new method2_SecondLevelSendersOutsidePackageWithTestOutside.
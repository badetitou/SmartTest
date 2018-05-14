testMethod2
testMethod2SecondLevelSendersInsidePackageWithTestOutside
	"Data for tests: this method calls a method not from the same package, which itself calls a method. Both are not from the same package as this test (both are located in SmartTestDataOutsideP1)"
	^ ('SmTClass','P1') asClass new method2SecondLevelSendersInsidePackageWithTestOutside.
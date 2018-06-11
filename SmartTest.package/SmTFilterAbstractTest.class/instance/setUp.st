running
setUp
	super setUp.
	smartFinder := SmartFinder new.
	smartFinder filter: SmTDefaultPackagesFilter new.
	testMethod1FirstLevelSendersInsidePackage := (('SmTClass' , 'TestP1') asClass
		>> ('test' , 'Method1FirstLevelSendersInsidePackage') asSymbol) asRingDefinition.
	testMethod1FirstLevelSendersOutsidePackage := (('SmTClass' , 'TestP2Test') asClass
		>> ('test' , 'Method1FirstLevelSendersOutsidePackage') asSymbol) asRingDefinition.
	testMethod2SecondLevelSendersInsidePackageWithTestInside := (('SmTClass' , 'TestP1')
		asClass >> ('test' , 'Method2SecondLevelSendersInsidePackageWithTestInside') asSymbol)
		asRingDefinition.
	testMethod2SecondLevelSendersOutsidePackageWithTestInside := (('SmTClass' , 'TestP1')
		asClass >> ('test' , 'Method2SecondLevelSendersOutsidePackageWithTestInside') asSymbol)
		asRingDefinition.
	testMethod2SecondLevelSendersInsidePackageWithTestOutside := (('SmTClass' , 'TestP2Test')
		asClass >> ('test' , 'Method2SecondLevelSendersInsidePackageWithTestOutside') asSymbol)
		asRingDefinition.
	testMethod2SecondLevelSendersOutsidePackageWithTestOutside := (('SmTClass' , 'TestP2Test')
		asClass
		>> ('test' , 'Method2SecondLevelSendersOutsidePackageWithTestOutside') asSymbol)
		asRingDefinition
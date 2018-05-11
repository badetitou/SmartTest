running
setUp
	smartFinder := SmartFinder new.
	smartFinder filter: SmTDefaultPackagesFilter new.
	test_p1_myMethod1_FirstLevelSendersInsidePackage := (('SmTClass','DefaultPackageTestP1') asClass >> ('test_p1_My','Method1_FirstLevelSendersInsidePackage') asSymbol ) asRingDefinition.
	test_p2_myMethod1_FirstLevelSendersOutsidePackage := (('SmTClass','DefaultPackageTestP2') asClass >> ('test_p2_My','Method1_FirstLevelSendersOutsidePackage') asSymbol ) asRingDefinition.
	test_p1_MyMethod2_SecondLevelSendersInsidePackageWithTestInside  := (('SmTClass','DefaultPackageTestP1') asClass >> ('test_p1_My','Method2_SecondLevelSendersInsidePackageWithTestInside') asSymbol ) asRingDefinition.
	test_p1_MyMethod2_SecondLevelSendersOutsidePackageWithTestInside := (('SmTClass','DefaultPackageTestP1') asClass >> ('test_p1_My','Method2_SecondLevelSendersOutsidePackageWithTestInside') asSymbol ) asRingDefinition.
	test_p2_MyMethod2_SecondLevelSendersInsidePackageWithTestOutside  := (('SmTClass','DefaultPackageTestP2') asClass >> ('test_p2_My','Method2_SecondLevelSendersInsidePackageWithTestOutside') asSymbol ) asRingDefinition.
	test_p2_MyMethod2_SecondLevelSendersOutsidePackageWithTestOutside  := (('SmTClass','DefaultPackageTestP2') asClass >> ('test_p2_My','Method2_SecondLevelSendersOutsidePackageWithTestOutside') asSymbol ) asRingDefinition.
	
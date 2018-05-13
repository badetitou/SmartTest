running
setUp
	smartFinder := SmartFinder new.
	smartFinder filter: SmTDefaultClassPackagesFilter new.
	smartFinder filter: (SmTSpecifyPackagesNameFilter packagesRegEx: 'SmartTestDataOutsideP1') new.
	
	test_method1_FirstLevelSendersInsidePackage  := (('SmTClass','TestP1') asClass >> ('test_','method1_FirstLevelSendersInsidePackage') asSymbol ) asRingDefinition.
	test_method1_FirstLevelSendersOutsidePackage := (('SmTClass','TestP2') asClass >> ('test_','method1_FirstLevelSendersOutsidePackage') asSymbol ) asRingDefinition.
	test_method2_SecondLevelSendersInsidePackageWithTestInside   := (('SmTClass','TestP1') asClass >> ('test_','method2_SecondLevelSendersInsidePackageWithTestInside') asSymbol ) asRingDefinition.
	test_method2_SecondLevelSendersOutsidePackageWithTestInside  := (('SmTClass','TestP1') asClass >> ('test_','method2_SecondLevelSendersOutsidePackageWithTestInside') asSymbol ) asRingDefinition.
	test_method2_SecondLevelSendersInsidePackageWithTestOutside  := (('SmTClass','TestP2') asClass >> ('test_','method2_SecondLevelSendersInsidePackageWithTestOutside') asSymbol ) asRingDefinition.
	test_method2_SecondLevelSendersOutsidePackageWithTestOutside := (('SmTClass','TestP2') asClass >> ('test_','method2_SecondLevelSendersOutsidePackageWithTestOutside') asSymbol ) asRingDefinition.
	
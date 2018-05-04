running
setUp
	smartFinder := SmartFinder new.
	smartFinder filter: SmTDefaultClassPackagesFilter new.
	
	testMethod1 := (SmTClassTest >> #testMethod1) asRingDefinition.
	testMethod2 := (SmTClassTest >> #testMethod2) asRingDefinition.
	testMethod3 := (SmTClassTest >> #testMethod3) asRingDefinition.
	testMethod4 := (SmTClassTest >> #testMethod4) asRingDefinition.
	testMethod5 := (SmTClassTest >> #testMethod5) asRingDefinition.
	testInheritedMethod1 := (RGMethodDefinition
				className: 'SmTInheritClassTest'
				selector: #testMethod1
				isMetaSide: false) .
	testMethodOutSidePackage1 := (SmTClassTest >> #testMethodOutSidePackage1) asRingDefinition.

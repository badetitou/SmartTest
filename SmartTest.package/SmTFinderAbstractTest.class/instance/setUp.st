initialization
setUp
	smartFinder := SmartFinder new.
	smartFinder filter: SmTDefaultClassPackagesFilter new.
	
	testMethod1 := RGMethodDefinition className: 'SmTClassTest' selector: #testMethod1 isMetaSide: false.
	testMethod2 := RGMethodDefinition className: 'SmTClassTest' selector: #testMethod2 isMetaSide: false.
	testMethod3 := RGMethodDefinition className: 'SmTClassTest' selector: #testMethod3 isMetaSide: false.
	testMethod4 := RGMethodDefinition className: 'SmTClassTest' selector: #testMethod4 isMetaSide: false.
	testMethod5 := RGMethodDefinition className: 'SmTClassTest' selector: #testMethod5 isMetaSide: false.
	testInheritedMethod1 := RGMethodDefinition className: 'SmTInheritClassTest' selector: #testMethod1 isMetaSide: false.
	testMethodOutSidePackage1 := RGMethodDefinition className: 'SmTClassTest' selector: #testMethodOutSidePackage1 isMetaSide: false.
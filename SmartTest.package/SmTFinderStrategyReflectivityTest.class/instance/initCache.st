initialization
initCache
	^ {((RGMethodDefinition className: 'SmTClass' selector: #method1 isMetaSide: false)
		->
			{testMethod1.
			testMethod2.
			testInheritedMethod1} asSet).
	((RGMethodDefinition className: 'SmTClass' selector: #method2 isMetaSide: false) -> {testMethod2} asSet).
	((RGMethodDefinition className: 'SmTClass' selector: #method3: isMetaSide: false)
		->
			{testMethod1.
			testMethod2.
			testMethod3} asSet).
	((RGMethodDefinition className: 'SmTClass' selector: #method4 isMetaSide: false)
		->
			{testMethod2.
			testMethod3.
			testMethod4} asSet).
	((RGMethodDefinition className: 'SmTClass2' selector: #initialize isMetaSide: false)
		-> {testMethod5} asSet).
	((RGMethodDefinition className: 'SmTClassTest' selector: #testMethod4 isMetaSide: false)
		-> {testMethod4} asSet)} asDictionary
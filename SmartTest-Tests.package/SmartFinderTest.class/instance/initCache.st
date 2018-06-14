initialization
initCache
	^ {((SmTClass >> #method1 )asRingDefinition
		->
			{(SmTClassTest >> #testMethod1 )asRingDefinition.
			(SmTClassTest >> #testMethod2 )asRingDefinition.
			(RGMethodDefinition className: 'SmTInheritClassTest' selector: #testMethod1 isMetaSide: false)} asSet).
	((SmTClass >> #method2 )asRingDefinition
		->
			{(SmTClassTest >> #testMethod2 )asRingDefinition}
				asSet).
	((SmTClass >> #method3: )asRingDefinition
		->
			{(SmTClassTest >> #testMethod1 )asRingDefinition.
			(SmTClassTest >> #testMethod2 )asRingDefinition.
			(SmTClassTest >> #testMethod3 )asRingDefinition}
				asSet).
	((SmTClass >> #method4 )asRingDefinition
		->
			{(SmTClassTest >> #testMethod2 )asRingDefinition.
			(SmTClassTest >> #testMethod3 )asRingDefinition.
			(SmTClassTest >> #testMethod4 )asRingDefinition}
				asSet).
	((SmTClass2 >> #initialize )asRingDefinition
		->
			{(SmTClassTest >> #testMethod5 )asRingDefinition}
				asSet).
	((SmTClassTest >> #testMethod4 )asRingDefinition
		->
			{(SmTClassTest >> #testMethod4 )asRingDefinition}
				asSet)} asDictionary
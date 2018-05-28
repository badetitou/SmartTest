initialization
initCache
	^ {((SmTClass >> #method1) asRingDefinition
		->
			{(SmTClassTest >> #testMethod1) asRingDefinition.
			(SmTClassTest >> #testMethod2) asRingDefinition.
			(RGMethodDefinition
				className: 'SmTInheritClassTest'
				selector: #testMethod1
				isMetaSide: false)} asSet).
	((SmTClass >> #method2) asRingDefinition
		-> {(SmTClassTest >> #testMethod2) asRingDefinition} asSet).
	((SmTClass >> #method3:) asRingDefinition
		->
			{(SmTClassTest >> #testMethod1) asRingDefinition.
			(SmTClassTest >> #testMethod2) asRingDefinition.
			(SmTClassTest >> #testMethod3) asRingDefinition} asSet).
	((SmTClass >> #method4) asRingDefinition
		->
			{(SmTClassTest >> #testMethod2) asRingDefinition.
			(SmTClassTest >> #testMethod3) asRingDefinition.
			(SmTClassTest >> #testMethod4) asRingDefinition} asSet).
	((SmTClass2 >> #initialize) asRingDefinition
		-> {(SmTClassTest >> #testMethod5) asRingDefinition} asSet).
	((SmTClassTest >> #testMethod4) asRingDefinition
		-> {(SmTClassTest >> #testMethod4) asRingDefinition} asSet).
	((('SmTP1' , 'Inheritance') asClass >> ('method1' , 'Inheritance') asSymbol)
		asRingDefinition
		->
			{(('SmTP1' , 'InheritanceSubClass1Test') asClass >> 'testMethod1Inheritance' asSymbol)
				asRingDefinition.
			(RGMethodDefinition className: 'SmTP1InheritanceSubClass2Test' selector:	#testMethod1Inheritance isMetaSide:	false)} asSet)} asDictionary
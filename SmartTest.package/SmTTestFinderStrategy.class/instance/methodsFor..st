api
methodsFor: aCompiledMethod
	^ self cache
		at: aCompiledMethod methodReference
		ifAbsent: [ (self testsForATestMethod: aCompiledMethod)
				ifNotEmpty: [ :methods | 
					^ (self testsForMethod: aCompiledMethod)
						addAll: (self computeInheritedTestFromDiscoveredTest: methods);
						yourself ].
			(self testsForASetUpMethod: aCompiledMethod)
				ifNotEmpty: [ :methods | 
					^ (self testsForMethod: aCompiledMethod)
						addAll: (self computeInheritedTestFromDiscoveredTest: methods);
						yourself ].
			(self testsForATearDownMethod: aCompiledMethod)
				ifNotEmpty: [ :methods | 
					^ (self testsForMethod: aCompiledMethod)
						addAll: (self computeInheritedTestFromDiscoveredTest: methods);
						yourself ].
			(self testsForAStandardMethod: aCompiledMethod)
				ifNotEmpty: [ :methods | 
					^ (self testsForMethod: aCompiledMethod)
						addAll: (self computeInheritedTestFromDiscoveredTest: methods);
						yourself ].
			self cache at: aCompiledMethod methodReference put: Set new.
			^ {} ]
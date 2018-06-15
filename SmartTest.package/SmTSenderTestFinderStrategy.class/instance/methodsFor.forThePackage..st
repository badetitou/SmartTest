api
methodsFor: aCompiledMethod forThePackage: packages
	^ self cache
		at: aCompiledMethod methodReference
		ifAbsent: [ (self searchTestsForATestMethod: aCompiledMethod)
				ifNotEmpty: [ :methods | 
					^ (self searchTestsForMethod: aCompiledMethod)
						addAll: (self computeInheritedTestFromDiscoveredTest: methods);
						yourself ].
			(self searchTestsForASetUpMethod: aCompiledMethod)
				ifNotEmpty: [ :methods | 
					^ (self searchTestsForMethod: aCompiledMethod)
						addAll: (self computeInheritedTestFromDiscoveredTest: methods);
						yourself ].
			(self searchTestsForATearDownMethod: aCompiledMethod)
				ifNotEmpty: [ :methods | 
					^ (self searchTestsForMethod: aCompiledMethod)
						addAll: (self computeInheritedTestFromDiscoveredTest: methods);
						yourself ].
			(self recursiveSearchForAStandardMethod: (aCompiledMethod asRingDefinition)  inPackages: packages )
				ifNotEmpty: [ :methods | 
					^ (self searchTestsForMethod: aCompiledMethod)
						addAll: (self computeInheritedTestFromDiscoveredTest: methods);
						yourself ].
			self cache at: aCompiledMethod methodReference put: Set new.
			^ {} ]
api
methodsFor: aCompiledMethod forThePackage: packages
	self flag: '24 july 2018 - What is this method ? If useless i or from another project i will remove it'.

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
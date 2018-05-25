api
methodsFor: aCompiledMethod
	| finalFoundMethods |
	^ self cache
		at: aCompiledMethod methodReference
		ifAbsent: [ #(testsForATestMethod: testsForASetUpMethod: testsForATearDownMethod: testsForAStandardMethod:)
				do: [ :heuristic | 
					(self perform: heuristic with: aCompiledMethod)
						ifNotEmpty: [ :methods | 
							finalFoundMethods := self testsForMethod: aCompiledMethod.
							finalFoundMethods addAll: (self computeInheritedTestFromDiscoveredTest: methods).
							^ finalFoundMethods ] ].
			self cache at: aCompiledMethod methodReference put: Set new.
			^ {} ]
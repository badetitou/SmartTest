api
methodsFor: aCompiledMethod
	| finalFoundMethod |
	^ self cache
		at: aCompiledMethod methodReference
		ifAbsent: [  (self shouldTryToFindTestForDynamic )
				ifFalse: [ ^ {} ].
			#(#searchTestsForATestMethod: #searchTestsForASetUpMethod: #searchTestsForATearDownMethod: #searchTestsForAStandardMethod:)
				do: [ :heuristic | 
					| methods |
					methods := [ self perform: heuristic with: aCompiledMethod ]
						on: MessageNotUnderstood
						do: [ #() ].
					methods isEmpty
						ifFalse: [ finalFoundMethod := self searchTestsForMethod: aCompiledMethod.
							finalFoundMethod addAll: (self computeInheritedTestFromDiscoveredTest: methods) asOrderedCollection.
							^ finalFoundMethod ] ].
			self cache at: aCompiledMethod methodReference put: Set new.
			^ {} ]
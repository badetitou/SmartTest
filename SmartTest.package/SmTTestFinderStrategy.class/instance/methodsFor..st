accessing
methodsFor: aCompiledMethod
	| finalFoundMethod |
	^ self methodToTest
		at: aCompiledMethod methodReference
		ifAbsent: [ #(testsForATestMethod: testsForASetUpMethod: testsForATearDownMethod: testsForAStandardMethod:)
				do: [ :heuristic | 
					| methods |
					methods := [ "self haltIf: [heuristic = #testsForAStandardMethod: ]." self perform: heuristic with: aCompiledMethod ]
						on: MessageNotUnderstood
						do: [ #() ].
					methods isEmpty
						ifFalse: [ finalFoundMethod := self testsForMethod: aCompiledMethod.
							finalFoundMethod addAll: (self computeInheritedTestFromDiscoveredTest: methods) asOrderedCollection.
							^ finalFoundMethod ] ].
			self methodToTest at: aCompiledMethod methodReference put: Set new.
			^ {} ]
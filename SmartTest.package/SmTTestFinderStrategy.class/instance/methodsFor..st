accessing
methodsFor: aCompiledMethod
	| finalFoundMethod |
	^ self methodToTest
		at: aCompiledMethod methodReference
		ifAbsent: [ #(testsForATestMethod: testsForASetUpMethod: testsForATearDownMethod: testsForAStandardMethod: testsForClassReferenceOf:)
				do: [ :heuristic | 
					| methods |
					methods := [ self perform: heuristic with: aCompiledMethod ]
						on: MessageNotUnderstood
						do: [ #() ].
					methods isEmpty
						ifFalse: [ finalFoundMethod := self testsForMethod: aCompiledMethod.
							finalFoundMethod addAll: (self computeInheritedTestFromDiscoveredTest: methods) asOrderedCollection.
							^ finalFoundMethod ] ].
			self methodToTest at: aCompiledMethod methodReference put: Set new.
			^ {} ]
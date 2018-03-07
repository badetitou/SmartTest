api
methodsFor: aCompiledMethod
	| finalFoundMethod |
	^ self cache
		at: aCompiledMethod methodReference
		ifAbsent: [  (self shouldTryToFindTestForDynamic not )
				ifTrue: [ ^ {} ].
			#(testsForATestMethod: testsForASetUpMethod: testsForATearDownMethod: testsForAStandardMethod:)
				do: [ :heuristic | 
					| methods |
					methods := [ self perform: heuristic with: aCompiledMethod ]
						on: MessageNotUnderstood
						do: [ #() ].
					methods isEmpty
						ifFalse: [ finalFoundMethod := self testsForMethod: aCompiledMethod.
							finalFoundMethod addAll: (self computeInheritedTestFromDiscoveredTest: methods) asOrderedCollection.
							^ finalFoundMethod ] ].
			self cache at: aCompiledMethod methodReference put: Set new.
			^ {} ]
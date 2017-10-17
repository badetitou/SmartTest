accessing
methodsFor: aCompiledMethod
	^ self methodToTest
		at: aCompiledMethod methodReference
		ifAbsent: [
		#( 	testsForATestMethod: 
			testsForASetUpMethod: 
			testsForATearDownMethod:
			testsForAStandardMethod:
			testsForClassReferenceOf:) do: 
				[:heuristic | |methods|
				methods := [self perform: heuristic with: aCompiledMethod] on: MessageNotUnderstood do: [ #() ].
				methods isEmpty ifFalse: [
					(self testsForMethod: aCompiledMethod) addAll: (self computeInheritedTestFromDiscoveredTest: methods) asOrderedCollection.
					^ (self testsForMethod: aCompiledMethod)]].
			self methodToTest
		at: aCompiledMethod methodReference put: Set new.
		^ {}. ]
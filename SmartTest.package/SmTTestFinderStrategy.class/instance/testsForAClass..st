accessing
testsForAClass: aClass
^ (self methodsForAClass: aClass) do: [:aMethod |self methodsFor: aMethod.].
	
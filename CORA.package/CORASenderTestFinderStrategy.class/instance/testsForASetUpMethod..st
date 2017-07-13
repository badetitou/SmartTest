API
testsForASetUpMethod: aCompiledMethod
	"If the method is a TestCase setUp, returns all the tests of this TestCase and its subclasses"
	^ (aCompiledMethod isTestSetUpMethod) 
				ifTrue: [|result|
					result := OrderedCollection new. 
					result addAll: aCompiledMethod methodClass allTestMethods.
					(aCompiledMethod methodClass subclasses do:[:aSubClass | result addAll: aSubClass allTestMethods]). 
					result]
				ifFalse: [{}].
private
testsForATearDownMethod: aCompiledMethod
	"If the method is a TestCase tearDown, returns all the tests of this TestCase"
	^ (aCompiledMethod isTestTearDownMethod) 
				ifTrue: [
					|result|
					result := OrderedCollection new. 
					result addAll: aCompiledMethod methodClass allTestMethods.
					(aCompiledMethod methodClass subclasses do:[:aSubClass | result addAll: aSubClass allTestMethods]).
					result collect: #methodReference]
				ifFalse: [{}].
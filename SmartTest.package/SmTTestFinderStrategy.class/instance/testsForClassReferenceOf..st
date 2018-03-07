private
testsForClassReferenceOf: aCompiledMethod
	"Find all tests in related packages that reference the method's class"
	| allSendersClass allTests |
	allSendersClass := (aCompiledMethod methodClass allCallsOn 
							collect: [:aReference| 
									 aReference actualClass]) asSet
							select: [:aClass| 
									(aClass isKindOf: TestCase class) ].
	
	allTests := OrderedCollection new.
	allSendersClass do: [:aClass|  allTests addAll: aClass allTestMethods].
	^ allTests collect: #methodReference.
api
searchTestsForClass: aClass
	"Find all tests in related packages that reference the method's class"
	| allSendersClass allTests |
	allSendersClass := (aClass allCallsOn 
							collect: [:aReference| 
									 aReference actualClass]) asSet
							select: [:aColectedClass| 
									(aColectedClass isKindOf: TestCase class) ].
	
	allTests := OrderedCollection new.
	allSendersClass do: [:aSenderClass|  allTests addAll: aSenderClass allTestMethods].
	^ allTests.
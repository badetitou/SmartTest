accessing
fillFailedTestListFromTestResult: aTestResult
	
	| list list2 |
	list := testList listItems asOrderedCollection.
	list := list
		reject: [ :a | ((TestResult historyAt: a class) at: #passed) includes: a selector ].
	list addAll: aTestResult errors.
	list addAll: aTestResult failures.
	list := (list collect: [ :a | (a class lookupSelector: a selector) methodReference ])
		asSet.
	self
		setList:
			((list
				collect: [ :methodReference | methodReference methodClass selector: methodReference selector ])
				asOrderedCollection sort: [ :a :b | a asString < b asString ])
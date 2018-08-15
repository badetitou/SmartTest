accessing
addToListTestsMethods: newTestMethod
	| list |
	list := testList listItems asOrderedCollection.
	list := (list collect: [ :a | (a class lookupSelector: a selector) methodReference  ]) asSet.
	list addAll: newTestMethod.
	self setList: ((list collect: [:methodReference | methodReference methodClass selector: methodReference selector]) asOrderedCollection sort: [ :a :b | a asString < b asString ] ) 
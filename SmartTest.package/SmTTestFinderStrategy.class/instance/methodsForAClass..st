accessing
methodsForAClass: aClass
|methodsFound|
	methodsFound := (aClass methods) asSet .
	aClass subclasses do:[:aSubClass | methodsFound addAll: (self methodsForAClass: aSubClass)].
	
	^methodsFound.
	
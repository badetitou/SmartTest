accessing
methodToTest
	^ MethodsToTests ifNil: [ MethodsToTests := Dictionary new ]
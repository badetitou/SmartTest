accessing
fillClassToTestForPackage: aPackage
	aPackage classes do: [ :aClass | self fillMethodToTestFrom: (CORAClassTestedRule new methodUsingVariablesOfClass: aClass) ]
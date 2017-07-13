accessing
fillClassToTestForPackage: aPackage
(	self availablePackages includes: aPackage) ifTrue: [   
	aPackage classes do: [ :aClass | self fillMethodToTestFrom: (CORAClassTestedRule new methodUsingVariablesOfClass: aClass) ] ]
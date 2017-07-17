jenkins
collectClassToTestForPackage: aPackage
	(self availablePackages includes: aPackage)
		ifTrue: [ ^ aPackage classes
				flatCollect: [ :aClass | CORAClassTestedRule new methodUsingVariablesOfClass: aClass ] ]
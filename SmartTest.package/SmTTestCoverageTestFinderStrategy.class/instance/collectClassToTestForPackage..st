jenkins
collectClassToTestForPackage: aPackage
	(self availablePackages includes: aPackage)
		ifTrue: [ ^ aPackage classes
				flatCollect: [ :aClass | SmTClassTestedRule new methodUsingVariablesOfClass: aClass ] ].
	^ OrderedCollection new
jenkins
collectClassToTestForPackage: aPackage
	(self availablePackages includes: aPackage)
		ifTrue: [ ^ (aPackage classes reject: #isTrait)
				flatCollect: [ :aClass | SmTClassTestedRule new methodUsingVariablesOfClass: aClass ] ].
	^ OrderedCollection new
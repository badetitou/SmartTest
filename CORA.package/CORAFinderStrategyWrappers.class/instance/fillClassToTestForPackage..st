accessing
fillClassToTestForPackage: aPackage
	aPackage classes do: [ :aClass | self testsForClass: aClass ]
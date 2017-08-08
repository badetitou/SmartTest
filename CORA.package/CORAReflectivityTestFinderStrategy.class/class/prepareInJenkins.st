accessing
prepareInJenkins
	| aCORAReflectivityFinder listOfTestsMethod |
	CompilationContext bytecodeBackend = OpalEncoderForSistaV1
		ifFalse: [ CompilationContext bytecodeBackend: OpalEncoderForSistaV1.
			Compiler recompileAll ].
	aCORAReflectivityFinder := self new.
	listOfTestsMethod := Smalltalk allTestMethods
		reject: [ :aTestMethod | aCORAReflectivityFinder isCORAMethodBlacklisted: aTestMethod ].
	listOfTestsMethod
		do:
			[ :aAvailableTestMethod | aCORAReflectivityFinder installLinkAndRunTest: aAvailableTestMethod ].
	CORAFinderSettings finder: self
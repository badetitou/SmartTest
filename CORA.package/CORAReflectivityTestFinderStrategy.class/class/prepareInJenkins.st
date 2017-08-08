accessing
prepareInJenkins
	| aCORAReflectivityFinder listOfTestsMethod |
	CompilationContext bytecodeBackend = OpalEncoderForSistaV1
		ifFalse: [ CompilationContext bytecodeBackend: OpalEncoderForSistaV1.
			OpalCompiler recompileAll ].
	aCORAReflectivityFinder := self new.
	listOfTestsMethod := (Smalltalk allTestMethods
		reject: [ :aTestMethod | aCORAReflectivityFinder isCORAMethodBlacklisted: aTestMethod ] )	collect: [ :method | method methodClass selector: method selector ].
	listOfTestsMethod
		do:
			[ :aAvailableTestMethod | aCORAReflectivityFinder installLinkAndRunTest: aAvailableTestMethod ] displayingProgress: [ :aAvailableTestMethod | 'Processing', aAvailableTestMethod asString  ].
	Smalltalk allMethods do: [:aCompiledMethod | self methodToTest at: aCompiledMethod ifAbsentPut: [ Set new ]].
	CORAFinderSettings finder: self
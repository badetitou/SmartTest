accessing
prepareInJenkins
	| aCORAReflectivityFinder listOfTestsMethod |
	CompilationContext bytecodeBackend = OpalEncoderForSistaV1
		ifFalse: [ CompilationContext bytecodeBackend: OpalEncoderForSistaV1.
			OpalCompiler recompileAll ].
	aCORAReflectivityFinder := self new.
	listOfTestsMethod := (Smalltalk allTestMethods
		reject: [ :aTestMethod | aCORAReflectivityFinder isCORAMethodBlacklisted: aTestMethod ])
		collect: [ :method | method methodClass selector: method selector ].
	listOfTestsMethod
		do: [ :aAvailableTestMethod | 
			[ aCORAReflectivityFinder installLinkAndRunTest: aAvailableTestMethod.
			MetaLink uninstallAll ]
				on: Error
				do: [  ] ]
		displayingProgress: [ :aAvailableTestMethod | 
			[ 'Processing ' , aAvailableTestMethod asString ]
				on: Error
				do: [ 'UnAsStringAble' ] ]
		every: 0.
	Smalltalk allMethods
		do: [ :aCompiledMethod | self methodToTest at: aCompiledMethod methodReference ifAbsentPut: [ Set new ] ].
	CORAFinderSettings finder: self.
	MetaLink uninstallAll
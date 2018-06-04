helper
instanceVariableNamed: aInstVarName fromClass: aClass 
	^ aClass instanceVariables select:[:instVar| instVar = aInstVarName ] .
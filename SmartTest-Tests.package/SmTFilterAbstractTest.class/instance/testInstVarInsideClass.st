test - instance variable
testInstVarInsideClass
"In this test we want to assert that if the modified class has subclasses, SmartTest finds all the inherited methods (implemented or not)"
	<CORATestBlacklisted>
	| testsFound aInstVar|
	aInstVar := self instanceVariableNamed: 'instVarModificationOnVariableInsideClass' fromClass: (('SmTClassP1ModificationOn','VariableInsideClassTest') asClass).
	testsFound := self searchTestsForInstVar: aInstVar ofClass: (('SmTClassP1ModificationOn','VariableInsideClassTest') asClass).
	self assert: (testsFound includes: (('SmTClassP1ModificationOn','VariableInsideClassTest') asClass >> ('testModificationOnVariable','InsideClass')asSymbol)asRingDefinition ).
	
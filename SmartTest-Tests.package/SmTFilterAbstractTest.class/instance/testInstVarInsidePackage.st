test - instance variable
testInstVarInsidePackage
"In this test we want to assert that if the modified class has subclasses, SmartTest finds all the inherited methods (implemented or not)"
	<CORATestBlacklisted>
	| testsFound aInstVar|
	aInstVar := self instanceVariableNamed: 'instVarModificationOnVariableInsidePackage' fromClass: ('SmTClassP1ModificationOn','Variable') asClass.
	testsFound := self searchTestsForInstVar: aInstVar ofClass: ('SmTClassP1ModificationOn','Variable') asClass.
	self assert: (testsFound includes: (('SmTClassP1ModificationOnVariable','InsidePackageTest') asClass >> ('testModificationOnVariable','InsidePackage')asSymbol)asRingDefinition ).
	
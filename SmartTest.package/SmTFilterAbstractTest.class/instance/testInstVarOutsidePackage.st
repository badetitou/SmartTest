test - instance variable
testInstVarOutsidePackage
"In this test we want to assert that if the modified class has subclasses, SmartTest finds all the inherited methods (implemented or not)"
	<CORATestBlacklisted>
	| testsFound aInstVar|
	aInstVar := self instanceVariableNamed: 'instVarModificationOnVariableOutsidePackage' fromClass: ('SmTClassP1ModificationOnVariable') asClass .
	testsFound := self searchTestsForInstVar: aInstVar ofClass: ('SmTClassP1ModificationOnVariable') asClass.
	self assert: (testsFound includes: (('SmTClassP1ModificationOnVariable','OutsidePackageTest') asClass >> ('testModificationOnVariable','OutsidePackage')asSymbol)asRingDefinition ).
	
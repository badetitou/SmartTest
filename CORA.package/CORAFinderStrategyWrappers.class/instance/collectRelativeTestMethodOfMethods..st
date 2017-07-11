accessing
collectRelativeTestMethodOfMethods: methods
	^ ((methods collect: [ :aMethod | aMethod asTestMethod ]) select: [ :aTestMethod | aTestMethod isNotNil ]) collect: [ :method | method methodClass selector: method selector ]
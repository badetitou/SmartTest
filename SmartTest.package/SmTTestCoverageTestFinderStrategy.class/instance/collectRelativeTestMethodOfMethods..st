search
collectRelativeTestMethodOfMethods: methods
	^ (self availableTestMethods
		intersection:
			((methods collect: [ :aMethod | aMethod asTestMethod ])
				select: [ :aTestMethod | aTestMethod isNotNil ]) asSet)
		collect: [ :method | method methodClass selector: method selector ]
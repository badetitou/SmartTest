search
collectRelativeTestMethodOfMethods: methods
	^ (((methods collect: [ :aMethod | aMethod asTestMethod ])
		select: [ :aTestMethod | aTestMethod isNotNil ])
		reject: [ :aTestMethod | self isCORAMethodBlacklisted: aTestMethod ])
		asSet
		collect: [ :method | method methodClass selector: method selector ]
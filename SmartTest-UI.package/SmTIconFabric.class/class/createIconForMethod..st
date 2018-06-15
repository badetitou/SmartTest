creation
createIconForMethod: testMethod
	| ib |
	ib := IconicButton new.
	ib
		target: SmTRules runner;
		actionSelector: #runCase:notifyIcon:;
		arguments:
			{testMethod.
			ib};
		labelGraphic:
			(self
				iconNamed: (SmTRules runner iconForTestFromTestCaseHistory: testMethod));
		color: Color transparent;
		borderColor: Color transparent;
		helpText: 'Run the test'.
	^ ib
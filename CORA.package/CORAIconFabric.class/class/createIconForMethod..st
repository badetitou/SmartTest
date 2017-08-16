creation
createIconForMethod: testMethod
	| ib |
	ib := IconicButton new.
	ib
		target: CORARunnerSettings runner;
		actionSelector: #runCase:notifyIcon:;
		arguments:
			{testMethod.
			ib};
		labelGraphic: (CORARunnerSettings runner iconForTestFromTestCaseHistory: testMethod) asIcon;
		color: Color transparent;
		borderColor: Color transparent;
		helpText: 'Run the test'.
	^ ib
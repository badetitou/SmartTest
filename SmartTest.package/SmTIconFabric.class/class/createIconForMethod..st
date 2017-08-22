creation
createIconForMethod: testMethod
	| ib |
	ib := IconicButton new.
	ib
		target: SmTRunnerSettings runner;
		actionSelector: #runCase:notifyIcon:;
		arguments:
			{testMethod.
			ib};
		labelGraphic: (SmTRunnerSettings runner iconForTestFromTestCaseHistory: testMethod) asIcon;
		color: Color transparent;
		borderColor: Color transparent;
		helpText: 'Run the test'.
	^ ib
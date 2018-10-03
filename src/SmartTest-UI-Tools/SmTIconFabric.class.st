"
I'm a tool which create the icons
"
Class {
	#name : #SmTIconFabric,
	#superclass : #Object,
	#category : 'SmartTest-UI-Tools'
}

{ #category : #creation }
SmTIconFabric class >> createIconForMethod: testMethod [
	| ib |
	ib := IconicButton new.
	ib
		target: SmartFinder runner;
		actionSelector: #runCase:notifyIcon:;
		arguments:
			{testMethod.
			ib};
		labelGraphic:
			(self
				iconNamed: (SmartFinder runner iconForTestFromTestCaseHistory: testMethod));
		color: Color transparent;
		borderColor: Color transparent;
		helpText: 'Run the test'.
	^ ib
]

{ #category : #creation }
SmTIconFabric class >> createIconForMethods: aTestCollection [
	| ib |
	ib := IconicButton new.
	ib
		target: SmTRules runner;
		actionSelector: #runCases:notifyIcon:;
		arguments:
			{aTestCollection.
			ib};
		labelGraphic:
			(self
				iconNamed: (SmTRules runner iconForTestFromTestsCasesHistory: aTestCollection));
		color: Color transparent;
		borderColor: Color transparent;
		helpText: 'Run the test'.
	^ ib
]

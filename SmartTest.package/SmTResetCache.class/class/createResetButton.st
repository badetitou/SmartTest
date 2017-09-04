as yet unclassified
createResetButton
	^ (Smalltalk ui theme 
		newButtonIn: World
		for: self
		getState: nil 
		action: nil
		arguments: nil
		getEnabled: nil
		getLabel: nil
		help: 'Reset SmartTest Cache' translated)
		label: 'Reset';
		actionBlock: [ SmTTestFinderStrategy resetMethodToTestCache ];
		yourself
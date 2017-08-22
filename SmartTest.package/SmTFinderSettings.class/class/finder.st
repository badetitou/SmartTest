settings-definition
finder 
	^ finder ifNil: [ finder := SmTSenderTestFinderStrategy   ]
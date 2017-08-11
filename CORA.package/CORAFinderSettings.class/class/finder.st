settings-definition
finder 
	^ finder ifNil: [ finder := CORASenderTestFinderStrategy   ]
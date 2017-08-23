protocol
researchProcess
	^ researchProcess ifNil: [ self initializeResearchProcess. ^ researchProcess   ]
protocol
initializeResearchProcess
	researchProcess := [ [ true ]
		whileTrue: [ self queue next value: false ] ] forkAt: Processor userSchedulingPriority
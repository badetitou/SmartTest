protocol
initializeResearchProcess
	researchProcess := [ [ true ]
		whileTrue: [ self queue next value ] ] forkAt: Processor userSchedulingPriority
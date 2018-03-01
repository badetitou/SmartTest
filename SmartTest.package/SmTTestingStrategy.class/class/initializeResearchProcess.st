protocol
initializeResearchProcess
	researchProcess := [ [ true ]
		whileTrue: [ | aBlock |
			aBlock := self queue next.
			aBlock value: false ] ] forkAt: Processor userSchedulingPriority
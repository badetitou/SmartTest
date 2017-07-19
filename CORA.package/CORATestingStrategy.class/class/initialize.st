protocol
initialize
	queue := SharedQueue new.
	[ [ true ]
		whileTrue: [ self queue next resume ] ] forkAt: Processor userSchedulingPriority
protocol
initialize
	queue := SharedQueue new.
	[ [ true ]
		whileTrue: [ self queue next value ] ] forkAt: Processor userSchedulingPriority
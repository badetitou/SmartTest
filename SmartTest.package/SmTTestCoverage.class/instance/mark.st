accessing
mark
	hasRun
		ifFalse: [ hasRun := true.
			 self finder
				addToCurrentExecutionMethodReference: reference ]
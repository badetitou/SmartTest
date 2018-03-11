accessing
mark
	hasRun
		ifFalse: [ hasRun := true.
			Transcript
				crLog: method asString. self finder
				addToCurrentExecutionMethodReference: reference ]
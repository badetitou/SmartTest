UI specific
showResult: aTestResult
	| ui |

	(aTestResult hasErrors or: aTestResult hasFailures)
		ifFalse: [ ^ self ].
	ui := SmTAutoTestsWindows new.
	ui setList: aTestResult tests.
	ui openWithSpec.

UI specific
showResult: aTestResult
	| ui |

	(aTestResult hasErrors or: aTestResult hasFailures)
		ifFalse: [ ^ self ].
	ui := SmtAutoTestsWindows new.
	ui setList: aTestResult tests.
	ui openWithSpec.

tests
testRunCasesNotifyIconYellow
	| case1 case2 case3 anIcon |
	case1 := self class selector: #noop.
	case2 := self class selector: #fail.
	case3 := self class selector: #noop.
	anIcon := IconicButton new.
	SmTRunnerSettings runner runCases: {case1.case2.case3} notifyIcon: anIcon.
	self assert: anIcon labelGraphic equals: (self iconNamed: #testYellowIcon)
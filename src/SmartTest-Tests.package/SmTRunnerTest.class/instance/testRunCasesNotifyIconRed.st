tests
testRunCasesNotifyIconRed
	| case1 case2 case3 anIcon |
	case1 := self class selector: #error.
	case2 := self class selector: #fail.
	case3 := self class selector: #error.
	anIcon := IconicButton new.
	runner
		runCases:
			{case1.
			case2.
			case3}
		notifyIcon: anIcon.
	self assert: anIcon labelGraphic equals: (self iconNamed: #testRedIcon)
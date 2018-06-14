tests
testRunCasesNotifyIconGreen
	| case1 case2 case3 anIcon result |
	case1 := self class selector: #noop.
	case2 := self class selector: #noop.
	case3 := self class selector: #noop.
	anIcon := IconicButton new.
	result := runner
		runCases:
			{case1.
			case2.
			case3}
		notifyIcon: anIcon.
	self assert: result passed size equals: 3.
	self assert: result errors size equals: 0.
	self assert: result failures size equals: 0.
	self assert: anIcon labelGraphic equals: (self iconNamed: #testGreenIcon)
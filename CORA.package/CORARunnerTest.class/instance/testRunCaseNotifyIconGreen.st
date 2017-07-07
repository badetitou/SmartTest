tests
testRunCaseNotifyIconGreen
	| case result anIcon |
	case := self class selector: #noop.
	anIcon := IconicButton new. 
	result := CORARunnerSettings runner runCase: case notifyIcon: anIcon.
	self assert: result passed size equals: 1.
	self assert: result errors size equals: 0.
	self assert: result failures size equals: 0.
	self assert: anIcon labelGraphic equals: #testGreenIcon asIcon
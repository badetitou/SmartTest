tests
testRunCaseNotifyIconRed
	| case anIcon |
	case := self class selector: #error.
	anIcon := IconicButton new.
	self should: [runner runCase: case notifyIcon: anIcon] raise: Error .
	self assert: anIcon labelGraphic equals: (self iconNamed: #testRedIcon)
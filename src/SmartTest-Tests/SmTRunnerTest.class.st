"
I test the behavior of the runner
"
Class {
	#name : #SmTRunnerTest,
	#superclass : #TestCase,
	#instVars : [
		'runner'
	],
	#category : 'SmartTest-Tests-Runner'
}

{ #category : #private }
SmTRunnerTest >> noop [
	
]

{ #category : #tests }
SmTRunnerTest >> setUp [
	runner := SmTRunnerStrategySmart.
]

{ #category : #tests }
SmTRunnerTest >> testIconForTestResultGreen [ 
	| case result  |
	case := self class selector: #noop.
	result := case run.
	self assert: (runner iconForTestResultOf: result) equals: (self iconNamed: #testGreenIcon)
]

{ #category : #tests }
SmTRunnerTest >> testIconForTestResultRed [
	| case result |
	case := self class selector: #error.
	result := case run.
	self assert: (runner iconForTestResultOf: result) equals: (self iconNamed: #testRedIcon)
	
]

{ #category : #tests }
SmTRunnerTest >> testIconForTestResultWhite [
	| result | 
	result := TestResult new.
	self
		assert: (runner iconForTestResultOf: result)
		equals: (self iconNamed: #testGreenIcon)
]

{ #category : #tests }
SmTRunnerTest >> testIconForTestResultYellow [
	| case result |
	case := self class selector: #fail.
	result := case run.
	self
		assert: (runner iconForTestResultOf: result)
		equals: (self iconNamed: #testYellowIcon)
]

{ #category : #tests }
SmTRunnerTest >> testRunCaseNotifyIconGreen [
	| case result anIcon |
	case := self class selector: #noop.
	anIcon := IconicButton new.
	result := runner runCase: case notifyIcon: anIcon.
	self assert: result passed size equals: 1.
	self assert: result errors size equals: 0.
	self assert: result failures size equals: 0.
	self
		assert: anIcon labelGraphic
		equals:
			(self iconNamed: #testGreenIcon)
]

{ #category : #tests }
SmTRunnerTest >> testRunCaseNotifyIconRed [
	| case anIcon |
	case := self class selector: #error.
	anIcon := IconicButton new.
	self should: [runner runCase: case notifyIcon: anIcon] raise: Error .
	self assert: anIcon labelGraphic equals: (self iconNamed: #testRedIcon)
]

{ #category : #tests }
SmTRunnerTest >> testRunCaseNotifyIconYellow [
	| case anIcon |
	case := self class selector: #fail.
	anIcon := IconicButton new.
	self should: [ runner runCase: case notifyIcon: anIcon ] raise: TestFailure.
	self assert: anIcon labelGraphic equals: (self iconNamed: #testYellowIcon)
]

{ #category : #tests }
SmTRunnerTest >> testRunCasesNotifyIconGreen [
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
]

{ #category : #tests }
SmTRunnerTest >> testRunCasesNotifyIconRed [
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
]

{ #category : #tests }
SmTRunnerTest >> testRunCasesNotifyIconYellow [
	| case1 case2 case3 anIcon |
	case1 := self class selector: #noop.
	case2 := self class selector: #fail.
	case3 := self class selector: #noop.
	anIcon := IconicButton new.
	runner runCases: {case1.case2.case3} notifyIcon: anIcon.
	self assert: anIcon labelGraphic equals: (self iconNamed: #testYellowIcon)
]

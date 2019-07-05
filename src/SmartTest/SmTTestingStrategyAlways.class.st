"
As soon as the tests are found. CORA run the test suite
"
Class {
	#name : #SmTTestingStrategyAlways,
	#superclass : #SmTTestingStrategy,
	#category : #'SmartTest-Testing'
}

{ #category : #'instance creation' }
SmTTestingStrategyAlways >> findTestsForMethod: aCompiledMethod [
	| tests |
	tests := self getMethodsFor: aCompiledMethod.
	self runner runCases: tests.
	^ tests
]

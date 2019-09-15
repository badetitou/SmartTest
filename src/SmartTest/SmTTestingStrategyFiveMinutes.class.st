"
Every 5 minutes, CORA run the tests which have been found in the last 5 minutes
"
Class {
	#name : #SmTTestingStrategyFiveMinutes,
	#superclass : #SmTTestingStrategy,
	#category : #'SmartTest-Testing'
}

{ #category : #protocol }
SmTTestingStrategyFiveMinutes >> disable [
	super disable.
	SmTFivesMinutesCollector stop
]

{ #category : #protocol }
SmTTestingStrategyFiveMinutes >> enable [
	super enable.
	SmTFivesMinutesCollector start
]

{ #category : #'instance creation' }
SmTTestingStrategyFiveMinutes >> findTestsForMethod: aCompiledMethod [
	| tests |
	tests := self getMethodsFor: aCompiledMethod.
	SmTFivesMinutesCollector addTestMethods: tests.
	^ tests
]

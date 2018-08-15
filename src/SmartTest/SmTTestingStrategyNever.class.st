"
CORA never run test automatically
"
Class {
	#name : #SmTTestingStrategyNever,
	#superclass : #SmTTestingStrategy,
	#category : 'SmartTest-Testing'
}

{ #category : #'instance creation' }
SmTTestingStrategyNever >> findTestsForMethod: aCompiledMethod [
	^ self getMethodsFor: aCompiledMethod
]

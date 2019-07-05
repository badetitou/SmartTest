"
The testing strategy defines when the tests we've found will be run.
"
Class {
	#name : #SmTTestingStrategy,
	#superclass : #Object,
	#instVars : [
		'finder',
		'runner'
	],
	#classInstVars : [
		'queue',
		'researchProcess',
		'defaultSize'
	],
	#category : #'SmartTest-Testing'
}

{ #category : #protocol }
SmTTestingStrategy >> disable [
	"can be override"
]

{ #category : #protocol }
SmTTestingStrategy >> enable [
	"can be override"
]

{ #category : #'instance creation' }
SmTTestingStrategy >> findTestsForMethod: aCompiledMethod [
	self subclassResponsibility 
]

{ #category : #'instance creation' }
SmTTestingStrategy >> finder [
	^ finder
	
]

{ #category : #'instance creation' }
SmTTestingStrategy >> finder: aSmTFinder [
	finder := aSmTFinder
]

{ #category : #'instance creation' }
SmTTestingStrategy >> getMethodsFor: aCompiledMethod [
	^ self getTestMethodFromCompiledTestMethod: (self finder methodsFor: aCompiledMethod)
]

{ #category : #'instance creation' }
SmTTestingStrategy >> getTestMethodFromCompiledTestMethod: aCollectionOfCompiledMethod [
	^ aCollectionOfCompiledMethod
		collect: [ :aCompiledMethod | aCompiledMethod methodClass selector: aCompiledMethod selector ]
]

{ #category : #'instance creation' }
SmTTestingStrategy >> runner [
	^ runner
]

{ #category : #'instance creation' }
SmTTestingStrategy >> runner: aSmTRunner [
	runner := aSmTRunner
]

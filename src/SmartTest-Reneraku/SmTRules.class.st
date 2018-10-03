"
I represent a kind of CORA structure
"
Class {
	#name : #SmTRules,
	#superclass : #ReAbstractRule,
	#instVars : [
		'tests'
	],
	#classVars : [
		'Activated'
	],
	#classInstVars : [
		'shouldTryToFindTestForDynamic',
		'activated',
		'smTCache',
		'smTClassTestingStrategy',
		'smTFilter',
		'smTFinder',
		'smTTestRunner',
		'collectionOfRegex',
		'limitNumberOfConcurentProcess'
	],
	#category : #'SmartTest-Reneraku'
}

{ #category : #settings }
SmTRules class >> activated [
	^ Activated ifNil: [ Activated := true ]
]

{ #category : #settings }
SmTRules class >> activated: aSelector [
	^ Activated := aSelector
]

{ #category : #accesing }
SmTRules class >> canBeRun [
	^ self activated
		and: [ (Process allSubInstances
				select: [ :each | 
					each isTerminated not
						and: [ each name beginsWith: 'Build result of a ClyAllBasisCritiques' ] ]) size
				< self limitNumberOfConcurentProcess ]
]

{ #category : #'instance creation' }
SmTRules class >> fillCache [
	SmTSelectPackageBrowser openWithSmartFinder: self testFinder

	
]

{ #category : #settings }
SmTRules class >> limitNumberOfConcurentProcess [
	^ limitNumberOfConcurentProcess ifNil: [ limitNumberOfConcurentProcess := 2 ]
]

{ #category : #settings }
SmTRules class >> limitNumberOfConcurentProcess: anObject [
	limitNumberOfConcurentProcess := anObject
]

{ #category : #settings }
SmTRules class >> settingsOn: aBuilder [
	<systemsettings>
	(aBuilder group: #SmTActivationRenrakuOption)
				order: 6;
				parent: #SmartTest;
				with: [ (aBuilder setting: #activated)
						target: self;
						order: 0.01;
						label: 'SmartTest Reneraku Integration Activated';
						description: 'Toogle to activate/disable the reneraku integration of the plugin'.
					(aBuilder setting: #limitNumberOfConcurentProcess)
						target: self;
						order: 0.02;
						label: 'Limit Concurent SmT processes for Calypso';
						description: 'Choose the limit of concurent process' ] 
]

{ #category : #'initialize - release' }
SmTRules class >> unload [
	self testFinder clean
]

{ #category : #accessing }
SmTRules >> activated [
	^ self class canBeRun
]

{ #category : #accessing }
SmTRules >> basicCheck: anEntity [
	^ self activated and: [ self isOnNautilusOrCalypso ]
]

{ #category : #'initialize-release' }
SmTRules >> findTestsForMethod: aCompiledMethod [
	^ tests := self class testFinder findTestsForMethod: aCompiledMethod
]

{ #category : #accessing }
SmTRules >> isOnNautilusOrCalypso [
	"20 items means at least Nautilus"
	| he |
	he := thisContext stack collect: [ :c | c methodClass asString ] .
	^ he anySatisfy: [:el | 'ClyNavigationEnvironment' match: el]
]

{ #category : #accessing }
SmTRules >> isVisible [
	^ false
]

{ #category : #accessing }
SmTRules >> severity [

	^ #information
]

{ #category : #accessing }
SmTRules >> tests [
	^ tests
]

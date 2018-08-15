"
I check method tests
"
Class {
	#name : #SmTMethodTestedRule,
	#superclass : #SmTRules,
	#classVars : [
		'MethodActivated'
	],
	#classInstVars : [
		'methodRuleStrategy'
	],
	#category : 'SmartTest-Rules'
}

{ #category : #'testing-interest' }
SmTMethodTestedRule class >> checksMethod [
	^ true
]

{ #category : #protocol }
SmTMethodTestedRule class >> disable [
]

{ #category : #protocol }
SmTMethodTestedRule class >> enable [
]

{ #category : #'testing-interest' }
SmTMethodTestedRule class >> initialize [
	ReRuleManager cleanUp 
]

{ #category : #'testing-interest' }
SmTMethodTestedRule class >> isMethodActivated [
	^ self methodActivated and: [ self methodRuleStrategy = self ]
]

{ #category : #'testing-interest' }
SmTMethodTestedRule class >> methodActivated [
	^ MethodActivated ifNil: [ MethodActivated := true ]
]

{ #category : #'testing-interest' }
SmTMethodTestedRule class >> methodActivated: aSelector [
	MethodActivated := aSelector
]

{ #category : #accessing }
SmTMethodTestedRule class >> methodRuleStrategy [
	^ methodRuleStrategy ifNil: [ methodRuleStrategy := SmTMethodTestedOnModificationRule. methodRuleStrategy enable ]
]

{ #category : #accessing }
SmTMethodTestedRule class >> methodRuleStrategy: aMethodRuleStrategy [
	methodRuleStrategy disable.
	methodRuleStrategy := aMethodRuleStrategy.
	aMethodRuleStrategy enable
]

{ #category : #'testing-interest' }
SmTMethodTestedRule class >> settingsOn: aBuilder [
	<systemsettings>
	(aBuilder setting: #methodActivated)
		parent: #SmTActivationRenrakuOption;
		target: self;
		order: 0.2;
		label: 'SmartTest method analyse activated';
		description: 'Toogle to activate/disable the analyse for method'.
	(aBuilder pickOne: #methodRuleStrategy)
		order: 0.3;
		parent: #SmTActivationRenrakuOption;
		label: 'Method Rule';
		target: self;
		domainValues: SmTMethodTestedRule withAllSubclasses;
		description: 'Select Rule strategy to begin the research of element'
]

{ #category : #'initialization-release' }
SmTMethodTestedRule class >> unload [
	self disable
]

{ #category : #running }
SmTMethodTestedRule >> basicCheck: anEntity [
	^ (super basicCheck: anEntity) and: [ (anEntity isKindOf: CompiledMethod) and: [ self class isMethodActivated ] ]
]

{ #category : #enumerating }
SmTMethodTestedRule >> check: anEntity forCritiquesDo: aCriticBlock [
	(self basicCheck: anEntity)
		ifTrue: [ (self findTestsForMethod: anEntity) isEmpty
				ifTrue: [ aCriticBlock value: (SmTMethodNeedTestsCritique for: anEntity by: self) ]
				ifFalse: [ aCriticBlock
						value: (SmTMethodRelativeTestsCritique for: anEntity by: self tests: self tests) ] ]
]

{ #category : #running }
SmTMethodTestedRule >> isVisible [
	^ true
]

{ #category : #running }
SmTMethodTestedRule >> name [
	^ 'SmartTest Method Tested'
]

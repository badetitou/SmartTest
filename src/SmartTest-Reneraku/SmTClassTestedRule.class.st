"
I check class tests
"
Class {
	#name : #SmTClassTestedRule,
	#superclass : #SmTRules,
	#classVars : [
		'ClassActivated'
	],
	#category : #'SmartTest-Reneraku'
}

{ #category : #'testing-interest' }
SmTClassTestedRule class >> checksClass [
	^ true
]

{ #category : #'testing-interest' }
SmTClassTestedRule class >> classActivated [
	^ ClassActivated ifNil: [ ClassActivated  := false ]
]

{ #category : #'testing-interest' }
SmTClassTestedRule class >> classActivated: aSelector [
	ClassActivated := aSelector
]

{ #category : #'testing-interest' }
SmTClassTestedRule class >> initialize [
	ReRuleManager cleanUp 
]

{ #category : #'testing-interest' }
SmTClassTestedRule class >> settingsOn: aBuilder [
	<systemsettings>
	(aBuilder setting: #classActivated)
		parent: #SmTActivationRenrakuOption;
		target: self;
		order: 0.1;
		label: 'SmartTest class analyse activated';
		description: 'Toogle to activate/disable the analyse for class'
]

{ #category : #'testing-interest' }
SmTClassTestedRule class >> unload [
	
]

{ #category : #running }
SmTClassTestedRule >> basicCheck: anEntity [
	^ (super basicCheck: anEntity) and: [(anEntity isKindOf: Class) and: [ self class classActivated] ]

]

{ #category : #enumerating }
SmTClassTestedRule >> check: anEntity forCritiquesDo: aCriticBlock [

	(self basicCheck: anEntity)
		ifTrue: [ (self findTestsForClass: anEntity) isEmpty
				ifTrue: [ aCriticBlock value: (SmTClassNeedTestsCritique for: anEntity by: self) ]
				ifFalse: [ aCriticBlock value: (SmTClassRelativeTestsCritique for: anEntity by: self tests: self tests) ] ]
]

{ #category : #'instance creation' }
SmTClassTestedRule >> findTestsForClass: aClass [
	| aCollectionOfCompiledTest |
	aCollectionOfCompiledTest :=  self findTestsForMethods: (self methodUsingVariablesOfClass: aClass).
	^ tests := aCollectionOfCompiledTest 
]

{ #category : #'instance creation' }
SmTClassTestedRule >> findTestsForMethods: aCollectionOfCompiledMethod [
	^ tests := aCollectionOfCompiledMethod flatCollect: [ :aCompiledMethod | self findTestsForMethod: aCompiledMethod]
]

{ #category : #running }
SmTClassTestedRule >> methodUsingVariablesOfClass: aClass [
	| aSet |
	aSet := Set new.
	aSet
		addAll: (aClass classLayout allVisibleSlots flatCollect: #usingMethods).
	"	aSet addAll: ((aClass classVariables flatCollect: #usingMethods) collect: #compiledMethod)."
	^ tests := aSet
]

{ #category : #accessing }
SmTClassTestedRule >> name [ 
	^ 'SmartTest Class Tested'
]

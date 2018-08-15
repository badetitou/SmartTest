Class {
	#name : #SmTSettingsCacheTest,
	#superclass : #SmTSettingsTest,
	#category : 'SmartTest-Tests-Settings'
}

{ #category : #testing }
SmTSettingsCacheTest class >> isAbstract [
	^ self = SmTSettingsCacheTest 
]

{ #category : #settings }
SmTSettingsCacheTest >> cacheStrategy [
	self subclassResponsibility 
]

{ #category : #tests }
SmTSettingsCacheTest >> testChangeCacheStrategy [
	"Test changement of the runner in the setting (throught SmTRules methods)"

	SmTRules cacheStrategy: self cacheStrategy.
	self assert: (SmTRules testFinder cacheStrategy isKindOf: self cacheStrategy).
	self assert: (SmTRules testFinder smtFinder cache isKindOf: self cacheStrategy)
]

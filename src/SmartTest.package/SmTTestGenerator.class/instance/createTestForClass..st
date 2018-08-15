widget method
createTestForClass: aClass
	| testClass className |
	aClass ifNil: [ ^ nil ].
	aClass isTestCase
		ifTrue: [ ^ nil ].
	aClass isMeta
		ifTrue: [ ^ nil ].
	className := self buildTestClassNameFrom: aClass.
	testClass := self class environment
		at: className
		ifPresent: [ :class | class ]
		ifAbsent: [ testClass := TestCase
				subclass: className
				instanceVariableNames: ''
				classVariableNames: ''
				package: (self buildTestPackageNameFrom: aClass).
			self class environment at: className.
			testClass comment: (self generateCommentForTestClass: testClass from: aClass) ].
	^ testClass
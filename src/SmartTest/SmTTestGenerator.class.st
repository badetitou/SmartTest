"
Tool easy to use by everyone to generate test from a Compiled Method
"
Class {
	#name : #SmTTestGenerator,
	#superclass : #Object,
	#category : #'SmartTest-Tools'
}

{ #category : #'widget method' }
SmTTestGenerator >> buildTestClassDefinitionFrom: aClass [

	^ 'TestCase subclass: ', (self buildTestClassNameFrom: aClass) printString, '
	instanceVariableNames: ''''
	classVariableNames: ''''
	poolDictionaries: ''''
	package: ''',(self buildTestPackageNameFrom:aClass),''''
]

{ #category : #'widget method' }
SmTTestGenerator >> buildTestClassNameFrom: aClass [
	
	^ (aClass name asString,'Test') asSymbol
]

{ #category : #'widget method' }
SmTTestGenerator >> buildTestPackageNameFrom:aClass [

	^ aClass package name asString, '-Tests' 
]

{ #category : #'widget method' }
SmTTestGenerator >> buildTestSelectorFor: aMethod [

	^ String streamContents: [:s || capitalize |
		capitalize := true.
		s << 'test'.
		aMethod selector do: [:c |
			c = $:
				ifTrue: [ capitalize := true ]
				ifFalse: [ capitalize
							ifTrue: [ 
								capitalize := false.
								s << c asUppercase. ]
							ifFalse:[ s << c ]]]]
			
]

{ #category : #'widget method' }
SmTTestGenerator >> createTestForClass: aClass [
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
]

{ #category : #'widget method' }
SmTTestGenerator >> generateCommentForTestClass: testClass from: aClass [

	^ String streamContents: [:stream || name |
			name := testClass name. 
			name first isVowel
				ifTrue: [ stream << 'An ']
				ifFalse:[ stream <<'A '].
			stream << name << ' is a test class for testing the behavior of '<< aClass name ]
]

{ #category : #'widget method' }
SmTTestGenerator >> generateSourceCodeForTestFrom: aMethod [
	^ (self buildTestSelectorFor: aMethod), String crlf,'	self shouldBeImplemented'
]

{ #category : #'widget method' }
SmTTestGenerator >> generateTestMethodFor: aMethod [
	"generate a test method for aMethod and return the generated method"

	| class testMethodName |
	testMethodName := aMethod methodClass name , 'Test'.
	class := Smalltalk allClasses
		detect: [ :e | e name = testMethodName ]
		ifNone: [ self createTestForClass: aMethod methodClass ].
	class
		ifNotNil: [ class
				compile: (self generateSourceCodeForTestFrom: aMethod)
				classified: 'tests-' , aMethod category.
			^ class >> (self buildTestSelectorFor: aMethod) asSymbol ].
	^ nil
]

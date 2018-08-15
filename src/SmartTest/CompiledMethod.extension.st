Extension { #name : #CompiledMethod }

{ #category : #'*SmartTest' }
CompiledMethod >> asTestCase [
	^ self methodClass selector: self selector
]

{ #category : #'*SmartTest' }
CompiledMethod >> belongsToTestCase [
	^ self methodClass isKindOf: TestCase class.
]

{ #category : #'*SmartTest' }
CompiledMethod >> isTestMethod [ 
  	^ 	self belongsToTestCase
		and: [ self methodClass allTestSelectors includes: self selector].
]

{ #category : #'*SmartTest' }
CompiledMethod >> isTestSetUpMethod [
	^ (self selector = #setUp) 
	   and: [self belongsToTestCase].
]

{ #category : #'*SmartTest' }
CompiledMethod >> isTestTearDownMethod [
	^ (self selector = #tearDown) 
	   and:[self belongsToTestCase]. 
]

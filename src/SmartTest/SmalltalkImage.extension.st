Extension { #name : #SmalltalkImage }

{ #category : #'*SmartTest' }
SmalltalkImage >> allMethods [

	^ globals allClasses flatCollect: #methods 
]

{ #category : #'*SmartTest' }
SmalltalkImage >> allTestMethods [

	^(globals allClasses flatCollect: #methods) select: #isTestMethod 
]

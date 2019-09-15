Extension { #name : #RGMethodDefinition }

{ #category : #'*SmartTest' }
RGMethodDefinition >> isInitializer [
	^ self selector = #initialize
]

{ #category : #'*SmartTest' }
RGMethodDefinition >> senders [
	^ SystemNavigation default allSendersOf: self selector
]

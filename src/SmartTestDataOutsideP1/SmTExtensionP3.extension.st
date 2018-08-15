Extension { #name : #SmTExtensionP3 }

{ #category : #'*SmartTestDataOutsideP1' }
SmTExtensionP3 >> extensionMethod2SecondLevelSenders [
"an extension"
('SmT','ExtensionP1') asClass >> #extensionMethod1SecondLevelSenders
]

private - search
collectSenderOfRGMethodeDefintion: aRGMethodDefinition
	^ aRGMethodDefinition isInitializer
		ifTrue: [ {#new senders.
			aRGMethodDefinition senders} asSet flattened  ]
		ifFalse: [ aRGMethodDefinition senders ]
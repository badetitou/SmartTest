private - search
collectSenderOfRGMethodeDefintion: aRGMethodDefinition
	^ aRGMethodDefinition isInitializer
		ifTrue: [ { SystemNavigation default allReferencesTo: aRGMethodDefinition methodClass binding.
			aRGMethodDefinition senders} asSet flattened  ]
		ifFalse: [ aRGMethodDefinition senders ]
accessing
recursiveSearchForAStandardMethod: aCompiledMethod withFilter: aFilter

	| senderMethods filteredSenderMethods |
	senderMethods := aCompiledMethod senders collect: #compiledMethod.
	filteredSenderMethods := senderMethods reject: [ :aSenderMethod | 
		aFilter shouldEntityBeFiltered: aSenderMethod ].

	filteredSenderMethods do: [ :aSenderCompiledMethod | 
			(self collectionOfMethod includes: aSenderCompiledMethod)
				ifFalse: [ 
					self collectionOfMethod add: aSenderCompiledMethod.
					self recursiveSearchForAStandardMethod: aSenderCompiledMethod withFilter: aFilter ] ].
	^ self collectionOfMethod
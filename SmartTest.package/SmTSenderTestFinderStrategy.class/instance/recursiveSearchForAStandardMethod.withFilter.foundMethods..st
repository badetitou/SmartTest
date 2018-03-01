private - search
recursiveSearchForAStandardMethod: aCompiledMethod withFilter: aFilter foundMethods: aCollection

	| senderMethods filteredSenderMethods |
	senderMethods := aCompiledMethod senders collect: #compiledMethod.
	filteredSenderMethods := senderMethods reject: [ :aSenderMethod | 
		aFilter shouldEntityBeFiltered: aSenderMethod ].
	
	filteredSenderMethods do: [ :aSenderCompiledMethod | 
			(aCollection includes: aSenderCompiledMethod)
				ifFalse: [ 
					aCollection add: aSenderCompiledMethod.
					self recursiveSearchForAStandardMethod: aSenderCompiledMethod withFilter: aFilter foundMethods: aCollection ] ]
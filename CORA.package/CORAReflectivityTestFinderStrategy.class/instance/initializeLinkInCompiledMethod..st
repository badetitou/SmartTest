accessing
initializeLinkInCompiledMethod: aCompiledMethod
	| link |
	link := MetaLink new
		metaObject: [ :receiver :selector | 
			| receiverCompiledMethod |
			receiverCompiledMethod := self extractCompiledMethodFromReceiver: receiver andSelector: selector.
			(self isCompiledMethod: receiverCompiledMethod alreadyExploredForTest: self currentTestExecution)
				ifFalse: [ self initializeLinkInCompiledMethod: receiverCompiledMethod ].
			self addATest: self currentTestExecution toMethod: receiverCompiledMethod ];
		selector: #value:value:;
		arguments: #(receiver selector);
		optionOneShot: true.
	aCompiledMethod sendNodes do: [ :node | node link: link ]
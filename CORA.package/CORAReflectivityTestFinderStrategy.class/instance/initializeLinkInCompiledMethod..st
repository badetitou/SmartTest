accessing
initializeLinkInCompiledMethod: aCompiledMethod
	| link |
	link := MetaLink new
		metaObject: [ :receiver :selector | 
			| receiverCompiledMethod |
			receiverCompiledMethod := self extractCompiledMethodFromReceiver: receiver andSelector: selector.
			self addATest: self currentTestExecution toMethod: receiverCompiledMethod. 
			self initializeLinkInCompiledMethod: receiverCompiledMethod ];
		selector: #value:value:;
		arguments: #(receiver selector);
		optionOneShot: true.
	aCompiledMethod sendNodes do: [ :node | node link: link ] 
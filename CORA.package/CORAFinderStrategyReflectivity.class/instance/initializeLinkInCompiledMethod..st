accessing
initializeLinkInCompiledMethod: aCompiledMethod
	| link |
	link := MetaLink new
		metaObject: [ :ctxt | 
			ctxt methodNode sendNodes do: [ :aMessageNode | self initializeLinkInCompiledMethod: (aMessageNode receiver name asClass lookupSelector: aMessageNode selector ) ].
			self addATest: self currentTestExecution toMethod: 'hello' ];
		selector: #value:;
		arguments: #(context);
		level: 0;
		optionOneShot: true.
	aCompiledMethod ast link: link
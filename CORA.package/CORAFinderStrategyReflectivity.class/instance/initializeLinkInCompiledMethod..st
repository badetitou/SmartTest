accessing
initializeLinkInCompiledMethod: aCompiledMethod
	| link |
	link := MetaLink new
		metaObject: [ :ctxt | 
			ctxt methodNode sendNodes do: [ :aMessageNode| self initializeLinkInNode: aMessageNode ].
			self addATest: self currentTestExecution toMethod: 'hello' ];
		selector: #value:;
		arguments: #(context);
		optionOneShot: true.
	aCompiledMethod ast link: link
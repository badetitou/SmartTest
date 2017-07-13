accessing
initializeLinkInNode: aNode
	| link |
	link := MetaLink new
		metaObject: [ :ctxt | 
			self addATest: self currentTestExecution toMethod: 'hello'
				];
		selector: #value:;
		arguments: #(context);
		level: 0;
		optionMetalevel: true;
		optionOneShot: true.
	  aNode link: link
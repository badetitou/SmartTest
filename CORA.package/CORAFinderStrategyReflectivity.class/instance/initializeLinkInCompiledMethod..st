accessing
initializeLinkInCompiledMethod: aCompiledMethod
	| link |
	link := MetaLink new
		metaObject: [ :ctxt | ctxt methodNode sendNodes do: [ :aMessageNode | self initializeLinkInNode: aMessageNode ] ];
		selector: #value:;
		arguments: #(context);
		level: 0;
		optionMetalevel: true;
		optionOneShot: true.
	self halt.
	aCompiledMethod ast link: link
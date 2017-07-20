accessing
initializeLinkInCompiledMethod: aCompiledMethod
	| link |
	link := MetaLink new
		metaObject: [ :ctxt | ];
		selector: #value:;
		arguments: #(context);
		optionMetalevel: true;
		optionOneShot: true.
	aCompiledMethod sendNodes do: [ :node| node link: link ]. 
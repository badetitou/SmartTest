accessing
initializeLinkInCompiledMethod: aCompiledMethod
	| link |
	link := MetaLink new
		metaObject: [ :ctxt | 
			| anfoundCompiledMethod |
			self halt.
			ctxt methodNode sendNodes
				do: [ :aMessageNode | 
					anfoundCompiledMethod := self findCompiledMethodFromMessageNode: aMessageNode.
					self initializeLinkInCompiledMethod: aMessageNode ] ];
		selector: #value:;
		arguments: #(context);
		level: 0;
		optionMetalevel: true;
		optionOneShot: true.
	aCompiledMethod sendNodes first link: link
accessing
initializeLink
	| link |
	link := MetaLink new
		metaObject: [ :aString | Transcript crShow: aString ];
		selector: #value:;
		arguments: #(context);
		optionOneShot: true.
	(CORAFinderStrategyReflectivityTest >> #testMethodToTest) ast link: link
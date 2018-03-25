initialization
initialize
	| wrappingBlock testPackage |
	super initialize.
	toSelectModel := self instantiate: ListPresenter.
	selectedModel := self instantiate: ListPresenter.
	selectedModel beMultipleSelection.
	toSelectModel beMultipleSelection.
	wrappingBlock := [ :package | package packageName ].
	toSelectModel displayBlock: wrappingBlock.
	selectedModel displayBlock: wrappingBlock.
	testPackage := MCWorkingCopy allManagers reject: [ :package | '*Test*' match:  package packageName ].
	toSelectModel items: (self sort: (toSelectModel  listItems \ testPackage))
"
I'm a tool that helps in selecting the packages that are going to be searched.
"
Class {
	#name : #SmTSelectPackageBrowser,
	#superclass : #SelectBrowser,
	#instVars : [
		'smartFinder'
	],
	#category : 'SmartTest-Tools'
}

{ #category : #opening }
SmTSelectPackageBrowser class >> openWithSmartFinder: aSmartFinder [
	self new
		smartFinder: aSmartFinder;
		items: RPackageOrganizer default packages;
		openWithSpec
]

{ #category : #api }
SmTSelectPackageBrowser >> addAllItems [
	| tmp |
	tmp := self sort: selectedModel listItems withAll: toSelectModel listItems.
	selectedModel items: tmp.
	toSelectModel items: #().
	toSelectModel updateList.
	selectedModel updateList
]

{ #category : #accessing }
SmTSelectPackageBrowser >> addItems [
	toSelectModel selectedItems
		ifNotNil: [ :items | 
			selectedModel items: (self sort: selectedModel listItems withAll: items).
			toSelectModel items: (self sort: toSelectModel listItems withoutAll: items) ].
	toSelectModel updateList.
	selectedModel updateList
]

{ #category : #api }
SmTSelectPackageBrowser >> createTestSuiteFrom: listItem [
	| testSuite |
	testSuite := TestSuite new.
	testSuite addTests: ((listItem flatCollect: #methods) select: #isTestMethod thenCollect: #asTestCase).
	^ testSuite
]

{ #category : #initialization }
SmTSelectPackageBrowser >> initialize [
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
]

{ #category : #api }
SmTSelectPackageBrowser >> nextAction [
	| past testSuite |
	testSuite := self createTestSuiteFrom: selectedModel listItems.
	past := smartFinder smtFinder.
	smartFinder smtFinder: SmTReflectivityTestFinderStrategy new.
	smartFinder buildCacheFromTestSuite: testSuite.
	smartFinder smtFinder: past.
	self delete
]

{ #category : #accessing }
SmTSelectPackageBrowser >> removeAllItems [
	| tmp |
	tmp := self sort: toSelectModel listItems withAll: selectedModel listItems.
	toSelectModel items: tmp.
	selectedModel items: #().
	toSelectModel updateList.
	selectedModel updateList
]

{ #category : #accessing }
SmTSelectPackageBrowser >> removeItems [
	selectedModel selectedItems
		ifNotNil: [ :items | 
			toSelectModel items: (self sort: toSelectModel listItems withAll: items).
			selectedModel items: (self sort: selectedModel listItems withoutAll: items) ].
	toSelectModel updateList.
	selectedModel updateList
]

{ #category : #accessing }
SmTSelectPackageBrowser >> smartFinder [
	^ smartFinder
]

{ #category : #accessing }
SmTSelectPackageBrowser >> smartFinder: anObject [
	smartFinder := anObject
]

{ #category : #accessing }
SmTSelectPackageBrowser >> sort: aCollection [
	^ aCollection asOrderedCollection sort: [:e1 :e2 | (e1 asString) < (e2 asString)].
]

{ #category : #accessing }
SmTSelectPackageBrowser >> sort: aCollection withAll: anotherCollection [
	^ self
		sort:
			(aCollection asOrderedCollection
				addAll: anotherCollection;
				yourself)
]

{ #category : #accessing }
SmTSelectPackageBrowser >> sort: aCollection withoutAll: anotherCollection [
	^ self
		sort:
			(aCollection asOrderedCollection
				removeAll: anotherCollection;
				yourself)
]

"
I represent a kind of CORA structure
"
Class {
	#name : #SmTRules,
	#superclass : #ReAbstractRule,
	#instVars : [
		'tests'
	],
	#classVars : [
		'Activated',
		'SmTSmartFinder'
	],
	#classInstVars : [
		'shouldTryToFindTestForDynamic',
		'activated',
		'smTCache',
		'smTClassTestingStrategy',
		'smTFilter',
		'smTFinder',
		'smTTestRunner',
		'collectionOfRegex'
	],
	#category : 'SmartTest-Rules'
}

{ #category : #settings }
SmTRules class >> activated [
	^ Activated ifNil: [ Activated := true ]
]

{ #category : #settings }
SmTRules class >> activated: aSelector [
	^ Activated := aSelector
]

{ #category : #settings }
SmTRules class >> cacheStrategy [
	^ smTCache ifNil: [ smTCache := SmTBasicCacheStrategy ]
]

{ #category : #settings }
SmTRules class >> cacheStrategy: aSelector [
	self testFinder cacheStrategy: aSelector new.
	^ smTCache := aSelector
]

{ #category : #'instance creation' }
SmTRules class >> fillCache [
	SmTSelectPackageBrowser openWithSmartFinder: self testFinder

	
]

{ #category : #settings }
SmTRules class >> filter [
	^ smTFilter ifNil: [ smTFilter := SmTIcebergLoadedPackagesFilter  ]
]

{ #category : #settings }
SmTRules class >> filter: aSelector [
	self testFinder filter: aSelector new.
	self propagateRegexToTestFinder.
	^ smTFilter := aSelector
]

{ #category : #settings }
SmTRules class >> finder [
	^ smTFinder ifNil: [ smTFinder := SmTSenderTestFinderStrategy ]
]

{ #category : #settings }
SmTRules class >> finder: aSelector [
	smTFinder := aSelector.
	self testFinder smtFinder: aSelector new.
	^ smTFinder
]

{ #category : #settings }
SmTRules class >> packagesRegex [
^ collectionOfRegex ifNil: [ collectionOfRegex := '' ] 
]

{ #category : #settings }
SmTRules class >> packagesRegex: aRegexStringCollection [
	collectionOfRegex := aRegexStringCollection.
	self propagateRegexToTestFinder.
]

{ #category : #settings }
SmTRules class >> propagateRegexToTestFinder [
	self testFinder filter class = SmTSpecifyPackagesNameFilter
		ifTrue: [ self testFinder filter packagesRegex: self packagesRegex ]
]

{ #category : #settings }
SmTRules class >> runner [
	^ smTTestRunner ifNil: [ smTTestRunner := SmTRunnerStrategySmart ]
]

{ #category : #settings }
SmTRules class >> runner: aSelector [
	smTTestRunner := aSelector.
	self testFinder testRunner: aSelector
]

{ #category : #settings }
SmTRules class >> settingsOn: aBuilder [
	<systemsettings>
	(aBuilder group: #SmartTest)
		with: [ (aBuilder group: #SmartFinder)
				order: 7;
				with: [ (aBuilder pickOne: #finder)
						order: 0;
						label: 'SmartTest finder';
						target: self;
						parent: #SmartFinder;
						domainValues: (SmTTestFinderStrategy allSubclasses select: #isConcreteFinder);
						description: 'The finder defines how CORA searchs the relative test of a method'.
					(aBuilder pickOne: #cacheStrategy)
						order: 2;
						label: 'SmartTest Cache';
						target: self;
						parent: #SmartFinder;
						domainValues: SmTCacheStrategy allSubclasses;
						description:
							'To visualize the current cache
				SmTCacheSettings cache new currentCache'.
					(aBuilder pickOne: #runner)
						order: 3;
						label: 'SmartTest test runner';
						target: self;
						parent: #SmartFinder;
						domainValues: SmTRunnerStrategy allSubclasses;
						description: 'The test runner defines if the tests are run in a debug way or not'.
					(aBuilder pickOne: #strategy)
						order: 1;
						label: 'SmartTest testing strategy';
						target: self;
						parent: #SmartFinder;
						domainValues: SmTTestingStrategy allSubclasses;
						description: 'The testing strategy defines when SmartTest will run the test it has found.'.
					(aBuilder pickOne: #filter)
						order: 0.5;
						label: 'SmartTest filter';
						target: self;
						parent: #SmTFilter;
						domainValues: SmTFilterStrategy allSubclasses;
						description: 'The testing strategy defines when SmartTest will run the test it has found.' ].
					(aBuilder setting: #packagesRegex)
		label: 'SmartTest filter Regex configuration';
		target: self;
		parent: #SmTFilter;
		ghostHelp: 'SmartTe|Star*Wnrs';
		notInStyle;
		default: '';
		description:
			'Change the value to scope the package you want to explore.
If you want to check the packages are well detected,run 
	SmTFilterSpecifyPackageSettings selectedPackage'.
			(aBuilder group: #SmTActivationRenrakuOption)
				order: 6;
				with: [ (aBuilder setting: #activated)
						target: self;
						order: 0.01;
						label: 'SmartTest Reneraku Integration Activated';
						description: 'Toogle to activate/disable the reneraku integration of the plugin' ].
			(aBuilder setting: #shouldTryToFindTestForDynamic)
				parent: 'Beta';
				target: self;
				order: 0.04;
				label: 'Try to find for Dynamic ';
				description:
					'When you click in a method, and have selected a Dynamix finder, we''''are updating the cache for it execution
	(BETA)'.
			(aBuilder group: #fill)
				label: 'Fill cache';
				target: self;
				parent: #Beta;
				dialog: [ SimpleButtonMorph new
						target: self;
						label: 'Fill cache';
						actionSelector: #fillCache;
						themeChanged;
						yourself ];
				description: 'Fill the cache with selected package' ].
	(aBuilder group: #reset)
		label: 'Reset Cache';
		target: self;
		parent: #SmartTest;
		order: 9;
		dialog: [ SimpleButtonMorph new
				target: self testFinder;
				label: 'Reset Current SmartTest Cache';
				actionSelector: #resetCache;
				themeChanged;
				yourself ];
		description:
			'Reset the cache of SmartTest
		SmTRules testFinder currentCache'.
	(aBuilder group: #Beta)
		parent: #SmartTest;
		order: 10
]

{ #category : #'instance creation' }
SmTRules class >> shouldTryToFindTestForDynamic [
	^ shouldTryToFindTestForDynamic ifNil: [ shouldTryToFindTestForDynamic := true ]
]

{ #category : #'instance creation' }
SmTRules class >> shouldTryToFindTestForDynamic: aBoolean [
	shouldTryToFindTestForDynamic := aBoolean.
	self testFinder shouldTryToFindTestForDynamic: aBoolean.
]

{ #category : #settings }
SmTRules class >> strategy [
	^ smTClassTestingStrategy ifNil: [ smTClassTestingStrategy := SmTTestingStrategyEachModification ]
]

{ #category : #settings }
SmTRules class >> strategy: aSelector [
	smTClassTestingStrategy := aSelector.
	self testFinder testingStrategy: aSelector new 
]

{ #category : #'instance creation' }
SmTRules class >> testFinder [
	^ SmTSmartFinder ifNil: [ SmTSmartFinder := SmartFinder new
		cacheStrategy: self cacheStrategy new;
		filter: self filter new;
		testRunner: self runner;
		smtFinder: self finder new;
		testingStrategy: self strategy new;
		shouldTryToFindTestForDynamic: self shouldTryToFindTestForDynamic ]
]

{ #category : #'instance creation' }
SmTRules class >> testFinder: aSmTSmartFinder [
	"It should be used only for tests"
	
	SmTSmartFinder := aSmTSmartFinder
]

{ #category : #'initialize - release' }
SmTRules class >> unload [
	self testFinder clean
]

{ #category : #accessing }
SmTRules >> activated [
	^ self class activated
]

{ #category : #accessing }
SmTRules >> basicCheck: anEntity [
	^ self activated and: [ self isOnNautilusOrCalypso ]
]

{ #category : #'initialize-release' }
SmTRules >> findTestsForMethod: aCompiledMethod [
	^ tests := self class testFinder findTestsForMethod: aCompiledMethod
]

{ #category : #accessing }
SmTRules >> isOnNautilusOrCalypso [
	"20 items means at least Nautilus"
	| he |
	he := thisContext stack collect: [ :c | c methodClass asString ] .
	^ he anySatisfy: [:el | 'ClyNavigationEnvironment' match: el]
]

{ #category : #accessing }
SmTRules >> isVisible [
	^ false
]

{ #category : #accessing }
SmTRules >> severity [

	^ #information
]

{ #category : #accessing }
SmTRules >> tests [
	^ tests
]

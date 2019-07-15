"
I'm the boss !!!

I contain the instance of all the stuff the user needs.

If you want to specify some strategy
use it more or less that way (here with the default values)

SmartFinder new
		cache: self cacheStrategy new;
		filter: self filter new;
		testRunner: self testRunner;
		smtFinder: self smtFinder new;
		testingStrategy: self testingStrategy new
"
Class {
	#name : #SmartFinder,
	#superclass : #Object,
	#instVars : [
		'filter',
		'testRunner',
		'testingStrategy',
		'smtFinder',
		'cacheStrategy',
		'shouldTryToFindTestForDynamic'
	],
	#classInstVars : [
		'smartFinder',
		'smTCache',
		'smTFilter',
		'smTFinder',
		'collectionOfRegex',
		'smTTestRunner',
		'shouldTryToFindTestForDynamic',
		'smTClassTestingStrategy'
	],
	#category : #'SmartTest-Core'
}

{ #category : #settings }
SmartFinder class >> cacheStrategy [
	^ smTCache ifNil: [ smTCache := SmTBasicCacheStrategy ]
]

{ #category : #settings }
SmartFinder class >> cacheStrategy: aSelector [
	self settingInstance cacheStrategy: aSelector new.
	^ smTCache := aSelector
]

{ #category : #settings }
SmartFinder class >> filter [
	^ smTFilter ifNil: [ smTFilter := SmTIcebergLoadedPackagesFilter  ]
]

{ #category : #settings }
SmartFinder class >> filter: aSelector [
	self settingInstance filter: aSelector new.
	self propagateRegexToTestFinder.
	^ smTFilter := aSelector
]

{ #category : #settings }
SmartFinder class >> finder [
	^ smTFinder ifNil: [ smTFinder := SmTSenderTestFinderStrategy ]
]

{ #category : #settings }
SmartFinder class >> finder: aSelector [
	smTFinder := aSelector.
	self settingInstance smtFinder: aSelector new.
	^ smTFinder
]

{ #category : #settings }
SmartFinder class >> packagesRegex [
^ collectionOfRegex ifNil: [ collectionOfRegex := '' ] 
]

{ #category : #settings }
SmartFinder class >> packagesRegex: aRegexStringCollection [
	collectionOfRegex := aRegexStringCollection.
	self propagateRegexToTestFinder.
]

{ #category : #settings }
SmartFinder class >> propagateRegexToTestFinder [
	self settingInstance filter class = SmTSpecifyPackagesNameFilter
		ifTrue: [ self settingInstance filter packagesRegex: self packagesRegex ]
]

{ #category : #settings }
SmartFinder class >> runner [
	^ smTTestRunner ifNil: [ smTTestRunner := SmTRunnerStrategySmart ]
]

{ #category : #settings }
SmartFinder class >> runner: aSelector [
	smTTestRunner := aSelector.
	self settingInstance testRunner: aSelector
]

{ #category : #'instance creation' }
SmartFinder class >> settingInstance [
	^ smartFinder ifNil: [ smartFinder := SmartFinder new
		cacheStrategy: self cacheStrategy new;
		filter: self filter new;
		testRunner: self runner;
		smtFinder: self finder new;
		testingStrategy: self strategy new;
		shouldTryToFindTestForDynamic: self shouldTryToFindTestForDynamic ]
]

{ #category : #'instance creation' }
SmartFinder class >> settingInstance: aSmTSmartFinder [
	"It should be used only for tests"
	
	smartFinder := aSmTSmartFinder
]

{ #category : #'instance creation' }
SmartFinder class >> settingsOn: aBuilder [
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
			(aBuilder setting: #shouldTryToFindTestForDynamic)
				parent: 'Beta';
				target: self;
				order: 0.04;
				label: 'Try to find for Dynamic ';
				description:
					'When you click in a method, and have selected a Dynamix finder, we''''are updating the cache for it execution
	(BETA)' ].
	(aBuilder group: #reset)
		label: 'Reset Cache';
		target: self;
		parent: #SmartTest;
		order: 9;
		dialog: [ SimpleButtonMorph new
				target: self settingInstance ;
				label: 'Reset Current SmartTest Cache';
				actionSelector: #emptyCache;
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
SmartFinder class >> shouldTryToFindTestForDynamic [
	^ shouldTryToFindTestForDynamic ifNil: [ shouldTryToFindTestForDynamic := true ]
]

{ #category : #'instance creation' }
SmartFinder class >> shouldTryToFindTestForDynamic: aBoolean [
	shouldTryToFindTestForDynamic := aBoolean.
	self settingInstance shouldTryToFindTestForDynamic: aBoolean.
]

{ #category : #settings }
SmartFinder class >> strategy [
	^ smTClassTestingStrategy ifNil: [ smTClassTestingStrategy := SmTTestingStrategyEachModification ]
]

{ #category : #settings }
SmartFinder class >> strategy: aSelector [
	smTClassTestingStrategy := aSelector.
	self settingInstance testingStrategy: aSelector new 
]

{ #category : #accessing }
SmartFinder >> autoUpdateCache: aBoolean [
	self smtListener cacheStrategy: self cacheStrategy.
	self smtListener smtDynamicFinder: self smtFinder.
	self smtListener class activated: aBoolean
]

{ #category : #api }
SmartFinder >> buildCacheFromTestSuite: aTestSuite [
	"Cache will be built only for a dynamic strategy"

	self smtFinder buildCacheFromTestSuite: aTestSuite
]

{ #category : #accessing }
SmartFinder >> cacheStrategy [
	^ cacheStrategy ifNil: [ cacheStrategy := SmTBasicCacheStrategy new cache: Dictionary new ]
]

{ #category : #accessing }
SmartFinder >> cacheStrategy: aSmTCacheStrategy [
	| tmpCache |
	tmpCache := self currentCache.
	cacheStrategy := aSmTCacheStrategy.
	cacheStrategy cache: tmpCache.
	self smtFinder cache: cacheStrategy
]

{ #category : #api }
SmartFinder >> clean [
	"Use before loosing my reference
	I remove the listener"
	self testingStrategy disable
]

{ #category : #api }
SmartFinder >> currentCache [
	^ self cacheStrategy currentCache 
]

{ #category : #api }
SmartFinder >> emptyCache [
	self cacheStrategy emptyCache 
]

{ #category : #accessing }
SmartFinder >> filter [
	^ filter ifNil: [ filter := SmTDefaultPackagesFilter new ]
]

{ #category : #accessing }
SmartFinder >> filter: aSmTDefaultPackagesFilter [
	filter := aSmTDefaultPackagesFilter.
		self smtFinder filter: aSmTDefaultPackagesFilter
]

{ #category : #api }
SmartFinder >> findTestsForMethod: aCompiledMethod [
	"This is the api for QA (use the testing strategy, the rule strategy etc.)
	If you only want to find the tests, please consider using #researchTestsForMethod:"

	^ [self testingStrategy findTestsForMethod: aCompiledMethod] on: Exception do: [ "oups" MetaLink uninstallAll.^ {  } ]
]

{ #category : #initialization }
SmartFinder >> initialize [
	 self shouldTryToFindTestForDynamic: false
]

{ #category : #api }
SmartFinder >> researchTestsForMethod: aCompiledMethod [ 
	"If you only want to find the tests"
	^ [ self smtFinder methodsFor: aCompiledMethod ] on: Exception do: [ "oups" MetaLink uninstallAll. ^ {  } ]
]

{ #category : #api }
SmartFinder >> resetCacheUsing: aTestSuite [
	self smtFinder resetCacheUsing: aTestSuite
]

{ #category : #api }
SmartFinder >> searchTestsForASetUpMethod: aCompiledMethod [ 
	^ self smtFinder searchTestsForASetUpMethod: aCompiledMethod.
]

{ #category : #api }
SmartFinder >> searchTestsForATearDownMethod: aCompiledMethod [ 
	^ self smtFinder searchTestsForATearDownMethod: aCompiledMethod
]

{ #category : #api }
SmartFinder >> searchTestsForATestMethod: aCompiledMethod [ 
	^ self smtFinder searchTestsForATestMethod: aCompiledMethod
]

{ #category : #api }
SmartFinder >> setCacheValues: aDictionnary [
	self cacheStrategy cache: aDictionnary.
]

{ #category : #accessing }
SmartFinder >> shouldTryToFindTestForDynamic [
	^ shouldTryToFindTestForDynamic
]

{ #category : #accessing }
SmartFinder >> shouldTryToFindTestForDynamic: aBoolean [
	shouldTryToFindTestForDynamic := aBoolean.
	self smtFinder shouldTryToFindTestForDynamic: aBoolean
]

{ #category : #accessing }
SmartFinder >> smtFinder [
	^ smtFinder
		ifNil: [ smtFinder := SmTSenderTestFinderStrategy new
				filter: self filter;
				cache: self cacheStrategy;
				shouldTryToFindTestForDynamic: self shouldTryToFindTestForDynamic;
				yourself  ]
]

{ #category : #accessing }
SmartFinder >> smtFinder: aSmTTestFinderStrategy [
	smtFinder := aSmTTestFinderStrategy.
	smtFinder
		filter: self filter;
		cache: self cacheStrategy;
		shouldTryToFindTestForDynamic: self shouldTryToFindTestForDynamic.
	self testingStrategy finder: aSmTTestFinderStrategy
]

{ #category : #accessing }
SmartFinder >> smtListener [
	^ SmTTestListener uniqueInstance 
]

{ #category : #accessing }
SmartFinder >> testRunner [
	^ testRunner ifNil: [ testRunner := SmTRunnerStrategySmart ]
]

{ #category : #accessing }
SmartFinder >> testRunner: aSmTRunnerStrategy [
	testRunner := aSmTRunnerStrategy.
	self testingStrategy runner: aSmTRunnerStrategy
]

{ #category : #accessing }
SmartFinder >> testingStrategy [
	^ testingStrategy ifNil: [ testingStrategy :=  SmTTestingStrategyEachModification new runner: self testRunner; finder: self smtFinder ]
]

{ #category : #accessing }
SmartFinder >> testingStrategy: aSmTTestingStrategy [
	testingStrategy disable.
	testingStrategy := aSmTTestingStrategy.
	testingStrategy
		runner: self testRunner;
		finder: self smtFinder.
	testingStrategy enable.
]

settings-definition
cacheSettingsOn: aBuilder
	<systemsettings>
	(aBuilder pickOne: #cache)
				label: 'SmartTest cache regression testing';
				target: self;
				parent: #SmTStrategyOption;
				domainValues: SmTCacheStrategy allSubclasses;
				description: 'If you want to use a Change Impact for finder strategy, you can also use a filter and define it here.
You can also use the default finder strategy and change the filter by another'.
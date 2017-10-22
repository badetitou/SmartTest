settings-definition
cacheSettingsOn: aBuilder
	<systemsettings>
	(aBuilder pickOne: #cache)
				label: 'SmartTest cache regression testing';
				target: self;
				parent: #SmTStrategyOption;
				domainValues: SmTCacheStrategy allSubclasses;
				description: 'To visualize the current cache
				SmTCacheSettings cache new currentCache'.
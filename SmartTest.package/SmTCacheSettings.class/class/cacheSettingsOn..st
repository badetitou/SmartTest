settings-definition
cacheSettingsOn: aBuilder
	<systemsettings>
	(aBuilder pickOne: #cache)
				label: 'SmartTest Cache';
				target: self;
				parent: #SmTStrategyOption;
				domainValues: SmTCacheStrategy allSubclasses;
				description: 'To visualize the current cache
				SmTCacheSettings cache new currentCache'.
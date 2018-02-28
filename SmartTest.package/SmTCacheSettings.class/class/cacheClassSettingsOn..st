settings-definition
cacheClassSettingsOn: aBuilder
	<systemsettings>
	(aBuilder pickOne: #cacheClass)
				label: 'SmartTest Cache';
				target: self;
				parent: #SmTStrategyOption;
				domainValues: SmTCacheStrategy allSubclasses;
				description: 'To visualize the current cache
				SmTCacheSettings cache new currentCache'.
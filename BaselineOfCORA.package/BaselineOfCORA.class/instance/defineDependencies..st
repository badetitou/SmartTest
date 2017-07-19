baselines
defineDependencies: spec
	spec
		baseline: 'ChangeImpact'
		with: [ spec
				repository: 'github://juliendelplanque/ChangeImpact/repository';
				loads: 'pharo' ].
	Process addInstVarNamed: 'level'. 
	spec
		package: 'Reflectivity' with: 'Reflectivity-BenoitVerhaeghe.340';
		repository: 'http://smalltalkhub.com/mc/Pharo/Pharo60Inbox/main'.
	spec
		configuration: 'Calypso'
		with: [ spec
				versionString: #stable;
				repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo60/main' ]
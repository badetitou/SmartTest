baselines
defineDependencies: spec
	spec
		baseline: 'ChangeImpact'
		with: [ spec
				repository: 'github://juliendelplanque/ChangeImpact/repository';
				loads: 'pharo' ].
	spec
		configuration: 'Calypso'
		with: [ spec
				versionString: #stable;
				repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo60/main' ]
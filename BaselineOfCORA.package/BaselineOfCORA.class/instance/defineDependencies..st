baselines
defineDependencies: spec
	spec
		baseline: 'ChangeImpact'
		with: [ spec
				repository: 'github://juliendelplanque/ChangeImpact/repository';
				loads: 'pharo' ].
	spec
		package: 'SLICE-Issue-20258-Fix-to-make-recursive-links-work'
			with: 'SLICE-Issue-20258-Fix-to-make-recursive-links-work-BenoitVerhaeghe.4';
		repository: 'http://smalltalkhub.com/mc/Pharo/Pharo60Inbox/main'.
	spec
		configuration: 'Calypso'
		with: [ spec
				versionString: #stable;
				repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo60/main' ]
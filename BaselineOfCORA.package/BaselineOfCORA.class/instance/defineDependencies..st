baselines
defineDependencies: spec
	spec
		baseline: 'ChangeImpact'
		with: [ spec
				repository: 'github://juliendelplanque/ChangeImpact/repository';
				loads: 'pharo' ].
	spec
		package: 'SLICE-Issue-20258-Fix-to-make-recursive-links-work'
			with: 'SLICE-Issue-20258-Fix-to-make-recursive-links-work-BenoitVerhaeghe.5';
		repository: 'http://smalltalkhub.com/mc/Pharo/Pharo60Inbox/main'.
	spec
		configuration: 'Calypso'
		with: [ spec
				versionString: #stable;
				repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo60/main' ].
	spec
		repository: 'http://smalltalkhub.com/mc/Pharo/Pharo60Inbox/main';
		package: 'Reflectivity' with: 'Reflectivity-BenoitVerhaeghe.343'.
		.
	spec
		package: 'Reflectivity-Tests' with: 'Reflectivity-Tests-BenoitVerhaeghe.231';
		repository: 'http://smalltalkhub.com/mc/Pharo/Pharo60Inbox/main'.
	spec
		package: 'Kernel' with: 'Kernel-BenoitVerhaeghe.2523';
		repository: 'http://smalltalkhub.com/mc/Pharo/Pharo60Inbox/main'.
	spec
		package: 'OpalCompiler-Core' with: 'OpalCompiler-Core-BenoitVerhaeghe.893';
		repository: 'http://smalltalkhub.com/mc/Pharo/Pharo60Inbox/main'.
	spec group: 'Slice-MetaLink' with: #('Kernel' 'Reflectivity' 'Reflectivity-Tests' 'OpalCompiler-Core')
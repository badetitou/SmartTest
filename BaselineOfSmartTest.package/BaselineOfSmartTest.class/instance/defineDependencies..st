baselines
defineDependencies: spec
	spec
		package: 'SLICE-Issue-20258-Fix-to-make-recursive-links-work'
		with: [ spec
				repository: 'http://smalltalkhub.com/mc/Pharo/Pharo60Inbox/main';
				file: 'SLICE-Issue-20258-Fix-to-make-recursive-links-work-BenoitVerhaeghe.5' ].
	spec
		configuration: 'Calypso'
		with: [ spec
				versionString: #stable;
				repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo60/main' ]
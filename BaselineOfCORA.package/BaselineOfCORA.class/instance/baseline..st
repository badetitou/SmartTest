baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ self defineDependencies: spec.
			spec
				repository: 'github://badetitou/CORA';
				package: 'CORA'
					with: [ spec
						package: 'SLICE-Issue-20258-Fix-to-make-recursive-links-work'
							with: 'SLICE-Issue-20258-Fix-to-make-recursive-links-work-BenoitVerhaeghe.2';
						repository: 'http://smalltalkhub.com/mc/Pharo/Pharo60Inbox/main' ];
				package: 'CORA-Calypso';
				group: 'default' with: #('CORA' 'ChangeImpact');
				group: 'calypso' with: #('default' 'Calypso' 'CORA-Calypso') ]
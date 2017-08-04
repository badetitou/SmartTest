baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ 
			spec preLoadDoIt: #preLoad.
			self defineDependencies: spec.
			spec
				addRepository: 'github://badetitou/CORA';
				package: 'CORA';
				package: 'CORA-Calypso';
				group: 'default'
					with: #('CORA' 'ChangeImpact' 'SLICE-Issue-20258-Fix-to-make-recursive-links-work');
				group: 'calypso' with: #('default' 'Calypso' 'CORA-Calypso') ]
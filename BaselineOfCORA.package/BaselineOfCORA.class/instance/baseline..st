baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ 
			spec preLoadDoIt: #preLoad.
			self defineDependencies: spec.
			spec
				repository: 'github://badetitou/CORA';
				package: 'CORA';
				package: 'CORA-Calypso';
				group: 'default'
					with: #('CORA' 'ChangeImpact' 'Slice-MetaLink');
				group: 'calypso' with: #('default' 'Calypso' 'CORA-Calypso') ]
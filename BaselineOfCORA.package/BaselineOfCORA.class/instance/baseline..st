baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ self defineDependencies: spec.
			spec
				repository: 'github://badetitou/CORA';
				package: 'CORA';
				package: 'CORA-Calypso';
				group: 'default' with: #('CORA');
				group: 'calypso' with: #('CORA-Calypso' 'CORA') ]
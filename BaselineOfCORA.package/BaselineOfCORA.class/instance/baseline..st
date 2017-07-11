baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ spec repository: 'github://badetitou/CORA';
			 package: 'CORA';
			 group: 'default' with: #('CORA') ]
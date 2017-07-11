baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ spec repository: 'github://badetitou/CORA'.
			spec package: 'CORA'.
			spec group: 'default' with: #('CORA') ]
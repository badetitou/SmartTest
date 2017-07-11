baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ spec package: 'CORA'.
			spec group: 'default' with: #('CORA') ]
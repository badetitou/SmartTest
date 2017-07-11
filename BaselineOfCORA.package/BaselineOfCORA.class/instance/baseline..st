baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ spec
				configuration: 'CORA'
				with: [ spec
						className: 'ConfigurationOfCORA';
						version: #stable;
						repository: 'github://badetitou/CORA/repository' ] ]
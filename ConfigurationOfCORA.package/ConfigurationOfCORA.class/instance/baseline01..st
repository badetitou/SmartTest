baselines
baseline01: spec
	<version: '0.1-baseline'>
	spec
		for: #common
		do: [ Metacello new
				baseline: 'ChangeImpact';
				repository: 'github://juliendelplanque/ChangeImpact/repository';
				load: 'pharo'.
			spec blessing: #baseline. ]
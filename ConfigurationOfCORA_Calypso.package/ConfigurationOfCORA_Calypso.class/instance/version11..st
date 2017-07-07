versions
version11: spec
	<version: '1.1' imports: #('0.2-baseline')>
	spec
		for: #common
		do: [ spec blessing: #stable.
			spec description: 'version 1.1'.
			spec author: 'BenoitVerhaeghe'.
			spec timestamp: '7/6/2017 10:49'.
			spec
				project: 'CORA' with: #stable;
				project: 'Calypso' with: #stable.
			spec package: #'CORA-Calypso' with: 'CORA-Calypso-BenoitVerhaeghe.4';
			repository: 'http://smalltalkhub.com/mc/badetitou/CORA/main/' ]
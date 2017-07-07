versions
version10: spec
	<version: '1.0' imports: #('0.1-baseline')>
	spec
		for: #common
		do: [ spec blessing: #stable.
			spec description: 'version 1.0'.
			spec author: 'BenoitVerhaeghe'.
			spec timestamp: '7/5/2017 15:23'.
			spec
				project: 'CORA' with: '1.1';
				project: 'Calypso' with: '0.7.1'.
			spec
				package: 'CORA-Calypso' with: 'CORA-Calypso-BenoitVerhaeghe.4';
				repository: 'http://smalltalkhub.com/mc/badetitou/CORA/main/' ]
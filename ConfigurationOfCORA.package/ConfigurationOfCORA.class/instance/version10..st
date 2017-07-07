versions
version10: spec
	<version: '1.0' imports: #('0.1-baseline')>
	spec
		for: #common
		do: [ spec blessing: #stable.
			spec description: 'version 1.0'.
			spec author: 'BenoitVerhaeghe'.
			spec timestamp: '7/5/2017 15:21'.
				
			spec repository: 'http://smalltalkhub.com/mc/badetitou/CORA/main';
			package: 'CORA' with: 'CORA-BenoitVerhaeghe.67' ]
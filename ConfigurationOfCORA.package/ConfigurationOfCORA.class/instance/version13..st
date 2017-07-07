versions
version13: spec
	<version: '1.3' imports: #('0.2-baseline')>
	spec
		for: #common
		do: [ spec blessing: #stable.
			spec description: 'version 1.3
From this version, you are able to change the strategy for testing. 
You can also your own.
We optimized CORA to avoid problem in sendersof or debugger or implementers.
We also clean some code, change spell, and fix stupid bugs'.
			spec author: 'BenoitVerhaeghe'.
			spec timestamp: '7/7/2017 10:56'.
			spec
				repository: 'http://smalltalkhub.com/mc/badetitou/CORA/main';
				package: #CORA with: 'CORA-BenoitVerhaeghe.80' ]
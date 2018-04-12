baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ 
			spec preLoadDoIt: #preLoad.
			self defineDependencies: spec.
			spec
				repository: 'github://badetitou/SmartTest' ;
				package: 'SmartTest';
				group: 'default'
					with: #('SmartTest')]
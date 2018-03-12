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
				package: 'SmartTest-Calypso';
				group: 'default'
					with: #('SmartTest');
				group: 'calypso' with: #('default' 'Calypso' 'SmartTest-Calypso') ]
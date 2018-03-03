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
					with: #('SmartTest' 'SLICE-Issue-20258-Fix-to-make-recursive-links-work') ]
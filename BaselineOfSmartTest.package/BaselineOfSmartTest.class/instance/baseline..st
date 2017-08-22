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
					with: #('SmartTest' 'ChangeImpact' 'SLICE-Issue-20258-Fix-to-make-recursive-links-work');
				group: 'calypso' with: #('default' 'Calypso' 'SmartTest-Calypso') ]
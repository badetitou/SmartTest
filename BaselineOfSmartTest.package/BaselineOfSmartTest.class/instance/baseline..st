baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [
			spec
				repository: 'github://badetitou/SmartTest' ;
				package: 'SmartTest';
				package: 'SmartTestDataOutsideP1' with: [ spec requires: #('SmartTest' 'SmartTestDataOutsideP3' 'SmartTestDataOutsideP2') ];
				package: 'SmartTestDataOutsideP2' with: [ spec requires: #('SmartTest') ];
				package: 'SmartTestDataOutsideP3' with: [ spec requires: #('SmartTest' 'SmartTestDataOutsideP4') ];
				package: 'SmartTestDataOutsideP4' with: [ spec requires: #('SmartTest') ];
				group: 'default'
					with: #('SmartTest' 'SmartTestDataOutsideP1' 'SmartTestDataOutsideP2' 'SmartTestDataOutsideP3')]
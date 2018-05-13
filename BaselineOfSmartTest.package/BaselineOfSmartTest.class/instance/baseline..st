baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [
			spec
				repository: 'github://badetitou/SmartTest' ;
				package: 'SmartTest';
				package: 'SmartTestDataOutsideP1' with: [ spec requires: #('SmartTest') ];
				package: 'SmartTestDataOutsideP2' with: [ spec requires: #('SmartTest') ];
				package: 'SmartTestDataOutsideP3' with: [ spec requires: #('SmartTest') ];
				package: 'SmT_TestData' with: [ spec requires: #('SmartTest') ];
				group: 'default'
					with: #('SmartTest' 'SmartTestDataOutsideP1' 'SmartTestDataOutsideP2' 'SmartTestDataOutsideP3' 'SmT_TestData')]
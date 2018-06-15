baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ spec
				repository: 'github://badetitou/SmartTest';
				package: 'SmartTest' with: [ spec requires: #('SmartTest-UI') ];
				package: 'SmartTest-Tests' with: [ spec requires: #('SmartTest' 'SmartTest-Tests-Data' 'SmartTestDataOutsideP1' 'SmartTestDataOutsideP3' 'SmartTestDataOutsideP2' 'SmartTestDataOutsideP4') ];
				package: 'SmartTestDataOutsideP1' with: [ spec requires: #('SmartTest' 'SmartTestDataOutsideP3' 'SmartTestDataOutsideP2') ];
				package: 'SmartTestDataOutsideP2' with: [ spec requires: #('SmartTest') ];
				package: 'SmartTestDataOutsideP3' with: [ spec requires: #('SmartTest' 'SmartTestDataOutsideP4') ];
				package: 'SmartTestDataOutsideP4' with: [ spec requires: #('SmartTest') ];
				package: 'SmartTest-Tests-Data' with: [ spec requires: #('SmartTest') ];
				package: 'SmartTest-UI' with: [ spec requires: #('SmartTest') ];
				group: 'default' with: #('SmartTest');
				group: 'test' with: #('SmartTest' 'SmartTest-Tests') ]
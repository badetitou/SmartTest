baselines
defineGroups: spec
	spec group: 'default' with: #('SmartTest' 'SmartTest-UI');
				group: 'test' with: #('SmartTest-Tests');
				group: 'all' with: #('default' 'test')
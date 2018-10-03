Class {
	#name : #BaselineOfSmartTest,
	#superclass : #BaselineOf,
	#category : 'BaselineOfSmartTest'
}

{ #category : #baselines }
BaselineOfSmartTest >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ self defineDependencies: spec.
			self definePackages: spec.
			self defineGroups: spec]
]

{ #category : #baselines }
BaselineOfSmartTest >> defineDependencies: spec [ 
]

{ #category : #baselines }
BaselineOfSmartTest >> defineGroups: spec [
	spec
		group: 'core' with: #('SmartTest');
		group: 'default' with: #('reneraku');
		group: 'reneraku' with: #('SmartTest-Reneraku');
		group: 'bigbutton' with: #('SmartTest-BigButton');
		group: 'test' with: #('SmartTest-Tests');
		group: 'all' with: #('default' 'test')
]

{ #category : #baselines }
BaselineOfSmartTest >> definePackages: spec [
	spec
		repository: 'github://badetitou/SmartTest';
		package: 'SmartTest';
		package: 'SmartTest-Tests'
			with: [ spec
				requires:
					#('SmartTest' 'SmartTest-Tests-Data' 'SmartTestDataOutsideP1' 'SmartTestDataOutsideP3' 'SmartTestDataOutsideP2' 'SmartTestDataOutsideP4') ];
		package: 'SmartTestDataOutsideP1'
			with: [ spec requires: #('SmartTest' 'SmartTestDataOutsideP3' 'SmartTestDataOutsideP2') ];
		package: 'SmartTestDataOutsideP2' with: [ spec requires: #('SmartTest') ];
		package: 'SmartTestDataOutsideP3' with: [ spec requires: #('SmartTest' 'SmartTestDataOutsideP4') ];
		package: 'SmartTestDataOutsideP4' with: [ spec requires: #('SmartTest') ];
		package: 'SmartTest-Tests-Data' with: [ spec requires: #('SmartTest') ];
		package: 'SmartTest-UI-Tools' with: [ spec requires: #('SmartTest') ];
		package: 'SmartTest-Reneraku' with: [ spec requires: #('SmartTest' 'SmartTest-UI-Tools') ];
		package: 'SmartTest-BigButton' with: [ spec requires: #('SmartTest' 'SmartTest-UI-Tools') ]
]

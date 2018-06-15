specs
defaultSpec
	^ SpecLayout composed
		newColumn: [ :row | row add: #button ] left: 0 right: 0.6;
		newColumn: [ :row | row add: #testList ] left: 0.4 right: 1;
		yourself
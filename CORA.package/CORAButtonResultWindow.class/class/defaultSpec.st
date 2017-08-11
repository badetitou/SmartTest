specs
defaultSpec
	^ SpecLayout composed
		newColumn: [ :row | row add: #button ] left: 0 right: 0.2;
		newColumn: [ :row | row add: #testList ] left: 0.2 right: 1;
		yourself
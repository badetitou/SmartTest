specs
defaultSpec
	^ SpecLayout composed
		newRow: [ :row | row  add: #testList] top: 0 bottom: 0.2 ;
		newRow: [ :row | row  add: #button]  top: 0.8 bottom: 0;
		yourself
accessing
subTestFromRGDefinition: anRGDefinition
	^ self
		computeInheritedTestFromDiscoveredTest:
			((anRGDefinition methodClass suite tests flatCollect: #tests)
				collect: [ :each | RGMethodDefinition class: each class selector: each selector ])
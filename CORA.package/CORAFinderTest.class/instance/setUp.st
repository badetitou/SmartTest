initialization
setUp
	"These tests only with this specific configuration. 
	Please change the settings or write your own tests.
	"

	self assert: CORAFilterSettings filter equals: CORADefaultClassPackagesFilter.
	self assert: CORAChangeImpactStrategySettings changeImpactStrategy equals: CORADefaultChangeImpactStrategy
instance creation
for: anEntity by: aRule tests: aTestList
	^ self basicNew
		initializeRule: aRule target: anEntity testsList: aTestList;
		yourself
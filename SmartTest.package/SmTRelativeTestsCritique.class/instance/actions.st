actions
actions
	^ super actions
		copyWith:
			(RePropertyAction new
				icon: #smallWindow asIcon;
				description: 'Open Tests Selection';
				action:
						[ :crit :package | self openTestsWindowWith: tests ];
				yourself)
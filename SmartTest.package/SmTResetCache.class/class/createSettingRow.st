settings
createSettingRow
	^ Smalltalk ui theme 
		newRowIn: World 
		for: {
			self createResetButton}
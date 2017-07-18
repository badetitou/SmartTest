drawing
drawOn: aCanvas
	aCanvas
		fillOval: bounds
		fillStyle: self fillStyle
		withPercentage: self percentage
		borderWidth: borderWidth
		borderColor: borderColor
accessing
initialize
	collector := Set new.
	morph := ProgressCircle new
		controler: self;
		percentage: 100;
		extent: 200@200;
		color: Color gray;
		openInWorld;
		hide
		
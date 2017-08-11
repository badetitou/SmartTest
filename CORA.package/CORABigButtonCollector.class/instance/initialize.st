accessing
initialize
	collector := Set new.
	morph := CORAButtonResultWindow new.
	morph controler: self.
	morph openWithSpec.
	"morph := ProgressCircle new
		controler: self;
		percentage: 100;
		extent: 200@200;
		color: Color gray;
		openInWorld;
		hide"
		
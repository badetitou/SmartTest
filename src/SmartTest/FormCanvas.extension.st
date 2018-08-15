Extension { #name : #FormCanvas }

{ #category : #'*SmartTest' }
FormCanvas >> fillOval: r color: fillColor withPercentage: aFloat borderWidth: borderWidth borderColor: borderColor [
	| rect |

	"draw the border of the oval"
	rect := (r translateBy: origin) truncated.
	(borderWidth = 0 or: [borderColor isTransparent]) ifFalse:[
		self setFillColor: borderColor.
		(r area > 10000 or: [fillColor isTranslucent]) 
			ifTrue: [port frameOval: rect borderWidth: borderWidth]
			ifFalse: [port fillOval: rect]]. "faster this way"
	"fill the inside"
	fillColor isTransparent ifFalse:
		[self setFillColor: fillColor.
		port fillOval: (rect insetBy: borderWidth)].

]

{ #category : #'*SmartTest' }
FormCanvas >> fillOval: aRectangle fillStyle: aFillStyle withPercentage: aFloat borderWidth: bw borderColor: bc [
	"Fill the given oval."

	(aFillStyle isBitmapFill and:[aFillStyle isKindOf: InfiniteForm]) ifTrue:[
		^self fillOval: aRectangle color: aFillStyle borderWidth: bw borderColor: bc].
	(aFillStyle isSolidFill) ifTrue:[
		^self fillOval: aRectangle withPercentage: aFloat color: aFillStyle asColor borderWidth: bw borderColor: bc].
	"Use a BalloonCanvas instead"
	self balloonFillOval: aRectangle fillStyle: aFillStyle borderWidth: bw borderColor: bc
]

{ #category : #'*SmartTest' }
FormCanvas >> fillOval: r withPercentage: aFloat color: fillColor borderWidth: borderWidth borderColor: borderColor [
	| rect |

	"draw the border of the oval"
	rect := (r translateBy: origin) truncated.
	(borderWidth = 0 or: [borderColor isTransparent]) ifFalse:[
		self setFillColor: borderColor.
		(r area > 10000 or: [fillColor isTranslucent]) 
			ifTrue: [port frameOval: rect borderWidth: borderWidth]
			ifFalse: [port fillOval: rect]]. "faster this way"
	"fill the inside"
	fillColor isTransparent ifFalse:
		[self setFillColor: fillColor.
		port fillOval: (rect insetBy: borderWidth) withPercentage: aFloat].

]

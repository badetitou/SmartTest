"
pc := ProgressCircle new color: Color blue.
pc extent: 500@500.
pc percentage: 0.3.
pc position: pc topRight.
pc openInWorld.

mes := MorphEventSubscription new
	recipient: CORAEventRecipient new;
	selector: #hello.

meh := MorphicEventHandler new 
	addSubscription: mes toEvent: #click.

pc eventHandler: meh.


"
Class {
	#name : #SmTProgressCircle,
	#superclass : #CircleMorph,
	#instVars : [
		'percentage',
		'controler'
	],
	#category : #'SmartTest-BigButton'
}

{ #category : #accessing }
SmTProgressCircle >> controler: anObject [
	controler := anObject
]

{ #category : #drawing }
SmTProgressCircle >> drawOn: aCanvas [
	aCanvas
		fillOval: bounds
		fillStyle: self fillStyle
		withPercentage: self percentage
		borderWidth: borderWidth
		borderColor: borderColor
]

{ #category : #drawing }
SmTProgressCircle >> handlesMouseDown: anEvent [ 
    ^ true
]

{ #category : #drawing }
SmTProgressCircle >> mouseDown: anEvent [
	controler notify
     
]

{ #category : #accessing }
SmTProgressCircle >> percentage [
	^ percentage
]

{ #category : #accessing }
SmTProgressCircle >> percentage: anObject [
	percentage := anObject.
	self changed
]

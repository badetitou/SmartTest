"
The announcer process announces that some event has occurred and disseminates it to all the listeners that are interested in the event. 
"
Class {
	#name : #SmTAnnouncer,
	#superclass : #Announcer,
	#classInstVars : [
		'announcer'
	],
	#category : 'SmartTest-Listener'
}

{ #category : #accessing }
SmTAnnouncer class >> announcer [
	^ announcer ifNil: [ announcer := SmTAnnouncer new ]
]

{ #category : #accessing }
SmTAnnouncer class >> shouldAnnounce [
	^ SmTTestListener activated
]

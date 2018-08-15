accessing
announcer
	^ announcer ifNil: [ announcer := SmTAnnouncer new ]
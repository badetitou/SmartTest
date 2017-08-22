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


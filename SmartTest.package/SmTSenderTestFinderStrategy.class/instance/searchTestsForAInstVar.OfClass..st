accessing
searchTestsForAInstVar: aInstanceVariable OfClass: aClass
	"This method returns all the tests related to a instance variable."

	| testsFound senders |
	testsFound := Set new.
	senders := Set new.
	senders
		addAll: ((aClass classLayout allVisibleSlots select: [ :eachSlot | eachSlot name = aInstanceVariable ]) flatCollect: #usingMethods).
	testsFound
		addAll: (senders flatCollect: [ :each | self methodsFor: each forThePackage: (filter extractPackagesFrom: aClass) ]).
	^ testsFound
Class {
	#name : #SmTResearchRelativeTestsCommand,
	#superclass : #CmdCommand,
	#category : #'SmartTest-CalypsoCommand'
}

{ #category : #accessing }
SmTResearchRelativeTestsCommand class >> canBeExecutedInContext: aToolContext [
	^ aToolContext hasSelectedItems
]

{ #category : #accessing }
SmTResearchRelativeTestsCommand class >> defaultMenuItemName [
	^ 'Compute relative tests'
]

{ #category : #activation }
SmTResearchRelativeTestsCommand class >> fullBrowserMenuActivation [
	<classAnnotation>
	
	^CmdContextMenuActivation byItemOf: CmdExtraMenuGroup for: ClyMethodContextOfFullBrowser 
]

{ #category : #execution }
SmTResearchRelativeTestsCommand >> execute [
	^  'hello'
]

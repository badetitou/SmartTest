accessing
installProxyFor: aTestCase
	[self installLinkAndRunTest: aTestCase.
			MetaLink uninstallAll ]
				on: Error
				do: [  ]
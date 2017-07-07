baselines
baseline02: spec
	<version: '0.2-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec 
			project: 'CORA' with: [
				spec
					className: #ConfigurationOfCORA;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/badetitou/CORA/main/' ];
			project: 'Calypso' with: [
				spec
					className: #ConfigurationOfCalypso;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo60/main/' ].
		spec package: #'CORA-Calypso';
		repository: 'http://smalltalkhub.com/mc/badetitou/CORA/main/'].

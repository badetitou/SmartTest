baselines
baseline02: spec
	<version: '0.2-baseline'>
	spec for: #'common' do: [
		spec blessing: #'baseline'.
		Metacello new baseline: 'ChangeImpact';
				repository: 'github://juliendelplanque/ChangeImpact/repository';
				load: 'pharo'.
		spec repository: 'http://smalltalkhub.com/mc/badetitou/CORA/main';
		package: #CORA. ].

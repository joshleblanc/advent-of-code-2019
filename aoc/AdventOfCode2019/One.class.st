Class {
	#name : #One,
	#superclass : #Object,
	#category : #AdventOfCode2019
}

{ #category : #'accessing structure variables' }
One >> a [
	^ self lines inject: 0 into: [ :sum :each | sum + (self fuel: each) ].
]

{ #category : #'accessing structure variables' }
One >> b [
	|fuel innerSum|
	^ self lines inject: 0 into: [ :sum :each |
			fuel := (self fuel: each).
			innerSum := 0.
			[ fuel <= 0 ] whileFalse: [
				innerSum := innerSum + fuel.
				fuel := self fuel: fuel.
			].  
			sum + innerSum.
		].
]

{ #category : #'as yet unclassified' }
One >> fuel: mass [
	^((mass / 3) floor) - 2.
]

{ #category : #accessing }
One >> lines [
	|working stream lines line|
	working := FileSystem disk workingDirectory. 
	stream := (working / 'aoc/one/input') readStream.
	lines := OrderedCollection new.
	[stream atEnd] whileFalse: [ 
		line := stream nextLine asNumber. 
	 	lines add: line.
	].
	^lines.
]

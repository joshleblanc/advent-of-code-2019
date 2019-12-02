"
Solution to question one of advent of code 2019.

Public API and Key Messages

- a   
- b 

   |one|
	one := One new.
	Transcript show: one a; cr.
"
Class {
	#name : #One,
	#superclass : #Object,
	#category : #'AdventOfCode2019-Solutions'
}

{ #category : #'accessing structure variables' }
One >> a: lines [
	^ lines inject: 0 into: [ :sum :each | sum + (self fuel: each) ].
]

{ #category : #'accessing structure variables' }
One >> b [
	|fuel innerSum|
	^ (Helpers lines: 'one.input') inject: 0 into: [ :sum :each |
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
	^((mass asNumber / 3) floor) - 2.
]

{ #category : #accessing }
One >> lines [
	|working stream lines line|
	working := FileSystem disk workingDirectory. 
	stream := (working / 'pharo-local/iceberg/advent-of-code-2019/aoc/one.input') readStream.
	lines := OrderedCollection new.
	[stream atEnd] whileFalse: [ 
		line := stream nextLine asNumber. 
	 	lines add: line.
	].
	^lines.
]

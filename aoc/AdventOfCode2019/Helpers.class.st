Class {
	#name : #Helpers,
	#superclass : #Object,
	#category : #AdventOfCode2019
}

{ #category : #accessing }
Helpers class >> lines: file [
	|working stream lines line|
	working := FileSystem disk workingDirectory. 
	stream := (working / 'pharo-local/iceberg/advent-of-code-2019/aoc/' / file) readStream.
	lines := OrderedCollection new.
	[stream atEnd] whileFalse: [ 
		line := stream nextLine asNumber. 
	 	lines add: line.
	].
	^lines.
]

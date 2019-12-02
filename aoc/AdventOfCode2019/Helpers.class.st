"
Helper methods for advent of code 2019

Public API and Key Messages

- lines: file 
	
	|lines|
	lines := Helpers lines: 'file''
   One simple example is simply gorgeous.
"
Class {
	#name : #Helpers,
	#superclass : #Object,
	#category : #'AdventOfCode2019-Libraries'
}

{ #category : #'as yet unclassified' }
Helpers class >> csv: file [
	|stream values value|
	stream := self readFile: file.
	values := OrderedCollection new.
	value := ''.
	[stream atEnd] whileFalse: [ 
		Transcript show: stream peek; cr.
		stream peek asString = ','
			ifFalse: [ value := value, stream next asString. Transcript show: 'number'. ]
			ifTrue: [ values add: value. value := ''. stream next. Transcript show: 'comma'. ]
	].
	^values.
]

{ #category : #accessing }
Helpers class >> lines: file [
	|stream lines line|
	stream := self readFile: file.
	lines := OrderedCollection new.
	[stream atEnd] whileFalse: [ 
		line := stream nextLine asNumber. 
	 	lines add: line.
	].
	^lines.
]

{ #category : #'as yet unclassified' }
Helpers class >> readFile: file [
	|working|
	working := FileSystem disk workingDirectory. 
	^(working / 'pharo-local/iceberg/advent-of-code-2019/aoc/' / file) readStream.
	
]

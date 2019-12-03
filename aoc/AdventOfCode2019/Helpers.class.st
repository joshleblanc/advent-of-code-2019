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
Helpers class >> csv: str [
	^str splitOn: ','.
]

{ #category : #accessing }
Helpers class >> lines: file [
	^(self readFile: file) lines.
]

{ #category : #'as yet unclassified' }
Helpers class >> readFile: file [
	|working|
	working := FileSystem disk workingDirectory. 
	^(working / 'pharo-local/iceberg/joshleblanc/advent-of-code-2019/aoc/' / file) readStream contents.
	
]

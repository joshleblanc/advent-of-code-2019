Class {
	#name : #TestCSV,
	#superclass : #TestCase,
	#category : #'AdventOfCode2019-Tests'
}

{ #category : #tests }
TestCSV >> testCSV [
	|result|
	result := Helpers csv: '1,2,3,4,5'.
	Transcript show: result.
	self assert: (result size) equals: 5.
]

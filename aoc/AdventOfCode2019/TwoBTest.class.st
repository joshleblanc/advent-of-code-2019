Class {
	#name : #TwoBTest,
	#superclass : #TestCase,
	#instVars : [
		'two'
	],
	#category : #'AdventOfCode2019-Tests'
}

{ #category : #tests }
TwoBTest >> testInput [
	|values|
	values := Helpers readFile: 'two.input'.
	two := TwoB new.
	two values: values; findOutput: 19690720.
	Transcript show: (two noun); show: (two verb).
	self assert: (two noun) equals: 80.
	self assert: (two verb) equals: 51.
]

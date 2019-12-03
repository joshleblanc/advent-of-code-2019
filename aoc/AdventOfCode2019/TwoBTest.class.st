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
	self assert: (two noun) equals: 0.
	self assert: (two verb) equals: 0.
]

Class {
	#name : #TwoB,
	#superclass : #TwoA,
	#category : #'AdventOfCode2019-Solutions'
}

{ #category : #'as yet unclassified' }
TwoB >> findOutput: target [
	|i j|
	i := 1.
	j := 1.
	[ self output = target ] whileFalse: [ 
		j := 1.
		[ self output = target | j > i ] whileFalse: [ 
			self reset; noun: i; verb: j; run.
			Transcript show: (self output); cr.
			j := j + 1.
		].
		i := i + 1.
	]
	
]

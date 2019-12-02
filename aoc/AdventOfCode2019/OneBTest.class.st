Class {
	#name : #OneBTest,
	#superclass : #TestCase,
	#instVars : [
		'one'
	],
	#category : #'AdventOfCode2019-Tests'
}

{ #category : #running }
OneBTest >> setUp [
	one := OneB new.
]

{ #category : #tests }
OneBTest >> test100756 [
	self assert: (one run: #(100756)) equals: 50346.
]

{ #category : #tests }
OneBTest >> test14 [
	self assert: (one run: #(14)) equals: 2.
]

{ #category : #tests }
OneBTest >> test1969 [
	self assert: (one run: #(1969)) equals: 966.
]

{ #category : #tests }
OneBTest >> testInput [
	self assert: (one run: (Helpers lines: 'one.input')) equals: 5094261.
]

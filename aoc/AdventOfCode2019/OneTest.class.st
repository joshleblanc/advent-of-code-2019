Class {
	#name : #OneTest,
	#superclass : #TestCase,
	#instVars : [
		'one'
	],
	#category : #'AdventOfCode2019-Tests'
}

{ #category : #running }
OneTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	super setUp.
	one := One new.
]

{ #category : #tests }
OneTest >> test100756 [
	self assert: (one a: #(100756)) equals: 33583.
]

{ #category : #tests }
OneTest >> test12 [
	self assert: (one a: #(12)) equals: 2.

]

{ #category : #tests }
OneTest >> test14 [
	self assert: (one a: #(14)) equals: 2.
]

{ #category : #tests }
OneTest >> test1969 [
	self assert: (one a: #(1969)) equals: 654.
]

{ #category : #tests }
OneTest >> testInput [
	|lines|
	lines := Helpers lines: 'one.input'.
	self assert: (one a: lines) equals: 3398090.
]

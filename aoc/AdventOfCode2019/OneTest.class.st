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
OneTest >> testA [
	self assert: (one a: #(12)) equals: 2.
	self assert: (one a: #(14)) equals: 2.
	self assert: (one a: #(1969)) equals: 654.
	self assert: (one a: #(100756)) equals: 33583.
]

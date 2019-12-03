Class {
	#name : #TwoATest,
	#superclass : #TestCase,
	#instVars : [
		'two'
	],
	#category : #'AdventOfCode2019-Tests'
}

{ #category : #running }
TwoATest >> setUp [
	two := TwoA new.
]

{ #category : #tests }
TwoATest >> testAddition [
	two setValues: '1,0,0,0,99'.
	self assert: (two run) equals: '2,0,0,0,99'.
]

{ #category : #tests }
TwoATest >> testBoth [
	two setValues: '1,1,1,4,99,5,6,0,99'.
	self assert: (two run) equals: '30,1,1,4,2,5,6,0,99'.
]

{ #category : #tests }
TwoATest >> testExtraValues [
	two setValues: '2,4,4,5,99,0'.
	self assert: (two run) equals: '2,4,4,5,99,9801'.
]

{ #category : #tests }
TwoATest >> testInput [
	two setValues: '1,0,0,0,99'.
	self assert: (two run) equals: '2,0,0,0,99'.
]

{ #category : #tests }
TwoATest >> testMultiplication [
	two setValues: '2,3,0,3,99'.
	self assert: (two run) equals: '2,3,0,6,99'.
]

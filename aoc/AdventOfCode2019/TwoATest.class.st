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
	|values|
	values := Helpers readFile: 'two.input'.
	two setValues: values.
	two programAlarm.
	self assert: (two run) equals: '4023471,12,2,2,1,1,2,3,1,3,4,3,1,5,0,3,2,1,6,24,1,5,19,25,1,23,6,27,1,5,27,28,1,31,6,30,1,9,35,33,2,10,39,132,1,43,6,134,2,6,47,268,1,5,51,269,1,55,13,274,1,59,10,278,2,10,63,1112,1,9,67,1115,2,6,71,2230,1,5,75,2231,2,79,13,11155,1,83,5,11156,1,87,9,11159,1,5,91,11160,1,5,95,11161,1,99,13,11166,1,10,103,11170,1,107,9,11173,1,6,111,11175,2,115,13,55875,1,10,119,55879,2,123,6,111758,1,5,127,111759,1,5,131,111760,1,135,6,111762,2,139,10,447048,2,143,9,1341144,1,147,6,1341146,1,151,13,1341151,2,155,9,4023453,1,6,159,4023455,1,5,163,4023456,1,5,167,4023457,1,10,171,4023461,1,13,175,4023466,1,179,2,4023468,1,9,183,0,99,2,14,0,0'.
]

{ #category : #tests }
TwoATest >> testMultiplication [
	two setValues: '2,3,0,3,99'.
	self assert: (two run) equals: '2,3,0,6,99'.
]

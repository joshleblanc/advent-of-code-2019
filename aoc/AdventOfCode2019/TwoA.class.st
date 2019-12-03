"
Solutions to advent of code 2019 question 2.

Public API and Key Messages

- a
- b 

	|two|
	two := Two new.
	Transcript show: two a.
"
Class {
	#name : #TwoA,
	#superclass : #Object,
	#instVars : [
		'values',
		'index',
		'originalValues'
	],
	#category : #'AdventOfCode2019-Solutions'
}

{ #category : #'accessing structure variables' }
TwoA >> a [
	^self get: index + 1.
]

{ #category : #'accessing structure variables' }
TwoA >> b [
	^self get: index + 2.
]

{ #category : #public }
TwoA >> get: i [
	|tmp|
	tmp := values at: i + 1.
	^values at: tmp + 1.
]

{ #category : #initialization }
TwoA >> index: v [
	index := v.
]

{ #category : #accessing }
TwoA >> next [
	index := index + 4.
]

{ #category : #'as yet unclassified' }
TwoA >> noun [
	^ values at: 2.
]

{ #category : #initialization }
TwoA >> noun: noun [
	values at: 2 put: noun.
	
]

{ #category : #'as yet unclassified' }
TwoA >> opCode [
	^values at: index + 1.

]

{ #category : #'as yet unclassified' }
TwoA >> output [
	^ values at: 1.
]

{ #category : #'as yet unclassified' }
TwoA >> pos [
	^(values at: index + 4) + 1
]

{ #category : #'as yet unclassified' }
TwoA >> programAlarm. [
	self noun: 12; verb: 2.
]

{ #category : #initialization }
TwoA >> reset [
	values := originalValues copy.
]

{ #category : #running }
TwoA >> run [
	index := 0.
	[ self opCode = 99 ] whileFalse: [
		self opCode = 1 
			ifTrue: [ values at: self pos put: self a + self b ]
			ifFalse: [ 
				self opCode = 2 ifTrue: [ values at: self pos put: self a * self b ].
			].
		
		self next.
	].
	^',' join: (values collect: [ :v | v asString ]).
]

{ #category : #initialization }
TwoA >> values: string [
	|valueCollection|
	valueCollection := ((Helpers csv: string) collect: [ :v | v asNumber ]).
	originalValues := valueCollection copy.
	values := valueCollection copy.
]

{ #category : #'as yet unclassified' }
TwoA >> verb [
	values at: 3.
]

{ #category : #initialization }
TwoA >> verb: verb [
	values at: 3 put: verb.
	
]

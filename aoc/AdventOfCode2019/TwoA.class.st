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
		'index'
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

{ #category : #accessing }
TwoA >> next [
	index := index + 4.
]

{ #category : #'as yet unclassified' }
TwoA >> opCode [
	^values at: index + 1.

]

{ #category : #'as yet unclassified' }
TwoA >> pos [
	^(values at: index + 4) + 1
]

{ #category : #'as yet unclassified' }
TwoA >> programAlarm. [
	values at: 2 put: 12.
	values at: 3 put: 2.
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
TwoA >> setIndex: v [
	index := v.
]

{ #category : #initialization }
TwoA >> setValues: string [
	values := ((Helpers csv: string) collect: [ :v | v asNumber ]).
]

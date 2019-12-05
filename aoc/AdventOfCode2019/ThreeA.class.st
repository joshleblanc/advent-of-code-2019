Class {
	#name : #ThreeA,
	#superclass : #Object,
	#instVars : [
		'lines'
	],
	#category : #'AdventOfCode2019-Solutions'
}

{ #category : #accessing }
ThreeA >> addLine: in [
	|values x y|
	x := 0.
	y := 0.
	values := Helpers csv: in.
	values := values collect: [ :value | 
		|dir num|
		dir := value first.
		num := value allButFirst asNumber.
		dir = $R ifTrue: [ x := x + num ].
		dir = $L ifTrue: [ x := x - num ].
		dir = $U ifTrue: [ y := y - num ].
		dir = $D ifTrue: [ y := y + num ].
		x@y.
	].
	values := values overlappingPairsCollect: [ :a :b | LineSegment from: a to: b ].
	lines add: values.
]

{ #category : #accessing }
ThreeA >> findDistanceToClosestIntersection [
	| dist |
	dist := nil.
	self intersections
		do: [ :intersection |
			|abs|
			abs := intersection abs. 
			dist isNil
				ifTrue: [ dist := abs x + abs y ]
				ifFalse: [ | tmp |
					tmp := abs x + abs y.
					dist := dist min: tmp ] ].
	^dist.
]

{ #category : #initialization }
ThreeA >> initialize [
	lines := OrderedCollection new.
]

{ #category : #'as yet unclassified' }
ThreeA >> intersections [
	|copy intersections|
	intersections := OrderedCollection new.
	copy := lines copy.
	lines do: [ :baseLine | 
		copy removeAt: 1. 
		baseLine do: [ :baseLineSegment |
			copy do: [ :targetLine | 
				targetLine do: [ :targetLineSegment | 
					|intersection|
					intersection := baseLineSegment intersectionWith: targetLineSegment.
					intersection isNil ifFalse: [ intersections add: intersection ].
				]	
			]
		].
	].
	^ intersections.
]

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
	| values x y points |
	x := 0.
	y := 0.
	values := Helpers csv: in.
	points := OrderedCollection new.
	values := values
		collect: [ :value | 
			| dir num |
			dir := value first.
			num := value allButFirst asNumber.
			num
				timesRepeat: [ dir = $R
						ifTrue: [ x := x + 1 ].
					dir = $L
						ifTrue: [ x := x - 1 ].
					dir = $U
						ifTrue: [ y := y + 1 ].
					dir = $D
						ifTrue: [ y := y - 1 ].
					points add: x @ y ] ].
	lines add: points.
]

{ #category : #accessing }
ThreeA >> findDistanceToClosestIntersection [
	| dist |
	dist := nil.
	self intersections
		do: [ :intersection | 
			| abs |
			abs := intersection abs.
			dist isNil
				ifTrue: [ dist := abs x + abs y ]
				ifFalse: [ | tmp |
					tmp := abs x + abs y.
					dist := dist min: tmp ] ].
	^ dist
]

{ #category : #initialization }
ThreeA >> initialize [
	lines := OrderedCollection new.
]

{ #category : #'as yet unclassified' }
ThreeA >> intersections [
	| copy intersections |
	intersections := OrderedCollection new.
	copy := lines copy.
	lines
		do: [ :baseLine | 
			copy removeAt: 1.
			copy
				do: [ :targetLine | 
					baseLine
						do: [ :point | 
							(targetLine includes: point)
								ifTrue: [ intersections add: point ] ] ] ].
	^ intersections
]

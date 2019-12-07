Class {
	#name : #ThreeATest,
	#superclass : #TestCase,
	#category : #'AdventOfCode2019-Tests'
}

{ #category : #tests }
ThreeATest >> testExample1 [
	|ans|
	ans := ThreeA new 
		addLine: 'R8,U5,L5,D3'; 
		addLine: 'U7,R6,D4,L4'; 
		findDistanceToClosestIntersection.
	self assert: ans equals: 6.
]

{ #category : #tests }
ThreeATest >> testExample2 [
	|ans|
	ans := ThreeA new 
		addLine: 'R75,D30,R83,U83,L12,D49,R71,U7,L72'; 
		addLine: 'U62,R66,U55,R34,D71,R55,D58,R83'; 
		findDistanceToClosestIntersection.
	self assert: ans equals: 159.
]

{ #category : #tests }
ThreeATest >> testExample3 [
	|ans|
	ans := ThreeA new 
		addLine: 'R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51'; 
		addLine: 'U98,R91,D20,R16,D67,R40,U7,R15,U6,R7'; 
		findDistanceToClosestIntersection.
	self assert: ans equals: 135.
]

{ #category : #tests }
ThreeATest >> testInput [
	|three ans lines|
	lines := Helpers lines: 'three.input'.
	three := ThreeA new.
	lines do: [ :line | three addLine: line ].
	
	ans := three findDistanceToClosestIntersection. 
	self assert: ans equals: 303.
]

Class {
	#name : #OneB,
	#superclass : #OneA,
	#category : #'AdventOfCode2019-Solutions'
}

{ #category : #running }
OneB >> run: lines [
	|fuel innerSum|
	^ lines inject: 0 into: [ :sum :each |
			fuel := (self fuel: each).
			innerSum := 0.
			[ fuel <= 0 ] whileFalse: [
				innerSum := innerSum + fuel.
				fuel := self fuel: fuel.
			].  
			sum + innerSum.
		].
]

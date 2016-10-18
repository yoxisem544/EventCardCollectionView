//
//  Arbitrary.swift
//  PhotoCarousell
//
//  Created by David on 2016/10/18.
//  Copyright © 2016年 David. All rights reserved.
//

import Foundation

protocol Arbitrary {
	static func arbitrary() -> Self
}

extension Int {
	static func random(from: Int, to: Int) -> Int {
		return from + (Int(arc4random()) % (to - from))
	}
}

extension Character : Arbitrary {
	
	static func arbitrary() -> Character {
		return Character(UnicodeScalar(Int.random(from: 65, to: 90))!)
	}
	
}

func tabulate<A>(times: Int, transform: (Int) -> A) -> [A] {
	return (0..<times).map(transform)
}

extension String : Arbitrary {
	
	internal static func arbitrary() -> String {
		let randomLength = Int.random(from: 0, to: 40)
		let randomCharaters = tabulate(times: randomLength) { _ in
			Character.arbitrary()
		}
		return String(randomCharaters)
	}

	static func arbitrary(forLength l: Int) -> String {
		let randomLength = Int.random(from: 1, to: l)
		let randomCharaters = tabulate(times: randomLength) { _ in
			Character.arbitrary()
		}
		return String(randomCharaters)
	}
}

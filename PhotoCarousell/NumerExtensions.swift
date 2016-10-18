//
//  NumerExtensions.swift
//  ColorgyCourse
//
//  Created by David on 2016/4/12.
//  Copyright © 2016年 David. All rights reserved.
//

import Foundation
import UIKit

extension CGFloat {
	var DoubleValue: Double {
		return Double(self)
	}
	
	var IntValue: Int {
		return Int(self)
	}
}

extension Double {
	var CGFloatValue: CGFloat {
		return CGFloat(self)
	}
	
	var RadianValue: Double {
		return (M_PI * self / 180.0)
	}
}

extension Int {
	var DoubleValue: Double {
		return Double(self)
	}
	
	var stringValue: String {
		return String(self)
	}
	
	var CGFloatValue: CGFloat {
		return CGFloat(self)
	}
	
	func times(_ block: @escaping (_ index: Int) -> Void) {
		guard self >= 0 else { return }
		for index in 0..<self {
			autoreleasepool {
				block(index)
			}
		}
	}
	
	var int32: Int32 {
		return Int32(self)
	}
	
	var roundedToMultipleOf5: Int {
		return self - self % 5
	}
	
	/// Will transform minute number to string
	/// eg 5 -> 05
	func toMinuteString() -> String {
		let minute = self >= 10 ? "\(self)" : "0\(self)"
		return minute
	}
}

extension Int32 {
	var int: Int {
		return Int(self)
	}
}

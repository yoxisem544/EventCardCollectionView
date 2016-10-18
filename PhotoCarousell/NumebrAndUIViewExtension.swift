//
//  NumebrAndUIViewExtension.swift
//  ColorgyCourse
//
//  Created by David on 2016/6/28.
//  Copyright © 2016年 David. All rights reserved.
//

import Foundation
import UIKit

extension Int {
	func point(below view: UIView) -> CGFloat {
		return view.frame.maxY + self.CGFloatValue
	}
	
	func pointRight(From view: UIView) -> CGFloat {
		return view.frame.maxX + self.CGFloatValue
	}
}

extension CGFloat {
	func point(below view: UIView) -> CGFloat {
		return view.frame.maxY + self
	}
}
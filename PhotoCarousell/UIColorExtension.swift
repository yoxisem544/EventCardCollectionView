//
//  UIColorExtension.swift
//  ColorgyCourse
//
//  Created by David on 2016/5/23.
//  Copyright © 2016年 David. All rights reserved.
//

import Foundation
import CoreImage
import UIKit

extension UIColor {
	func withAlpha(_ alpha: CGFloat) -> UIColor {
		guard let CIColor = self.coreImageColor else { return self }
		
		let r = CIColor.red
		let g = CIColor.green
		let b = CIColor.blue
		
		return UIColor(red: r, green: g, blue: b, alpha: alpha)
	}
	
	var coreImageColor: CoreImage.CIColor? {
		return CoreImage.CIColor(color: self)
	}
	
	convenience init(hexString: String) {
		let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
		let scanner = Scanner(string: hexString)
		
		if (hexString.hasPrefix("#")) {
			scanner.scanLocation = 1
		}
		
		var color:UInt32 = 0
		scanner.scanHexInt32(&color)
		
		let mask = 0x000000FF
		let r = Int(color >> 16) & mask
		let g = Int(color >> 8) & mask
		let b = Int(color) & mask
		
		let red   = CGFloat(r) / 255.0
		let green = CGFloat(g) / 255.0
		let blue  = CGFloat(b) / 255.0
		
		self.init(red:red, green:green, blue:blue, alpha:1)
	}
	
	func toHexString() -> String {
		var r: CGFloat = 0
		var g: CGFloat = 0
		var b: CGFloat = 0
		var a: CGFloat = 0
		
		getRed(&r, green: &g, blue: &b, alpha: &a)
		
		let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
		
		return String(format: "#%06x", rgb)
	}
}

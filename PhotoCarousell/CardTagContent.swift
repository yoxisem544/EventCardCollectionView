//
//  CardTagContent.swift
//  PhotoCarousell
//
//  Created by David on 2016/10/19.
//  Copyright © 2016年 David. All rights reserved.
//

import UIKit

fileprivate struct Keys {
	static let name = "name"
	static let color = "color"
}

public struct CardTagContent {
	
	let name: String?
	let color: UIColor?
	
}

extension CardTagContent : JSONDecodable {
	
	init(decodeWith json: JSON) throws {
		guard let name = json[Keys.name].string else { throw JSONDecodableError.parseError }
		guard let colorString = json[Keys.color].string else { throw JSONDecodableError.parseError }
		self.name = name
		self.color = UIColor(hexString: colorString)
	}
	
}

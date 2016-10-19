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
	
	public static func generateTags(with json: JSON)-> [CardTagContent] {
		var contents: [CardTagContent] = []
		if json.type == .array {
			for (_, json) in json {
				if let tag = try? CardTagContent(decodeWith: json) {
					contents.append(tag)
				}
			}
		} else {
			if let tag = try? CardTagContent(decodeWith: json) {
				contents.append(tag)
			}
		}
		return contents
	}
	
}

extension CardTagContent : JSONDecodable {
	
	public init(decodeWith json: JSON) throws {
		guard let name = json[Keys.name].string else { throw JSONDecodableError.parseError }
		guard let colorString = json[Keys.color].string else { throw JSONDecodableError.parseError }
		self.name = name
		self.color = UIColor(hexString: colorString)
	}
	
}

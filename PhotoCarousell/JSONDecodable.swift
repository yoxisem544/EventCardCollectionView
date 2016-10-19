//
//  JSONDecodable.swift
//  CalendarApp
//
//  Created by David on 2016/9/5.
//  Copyright © 2016年 David. All rights reserved.
//

import Foundation

/// JSONDecodableError
///
/// - parseError: Error while parsing from JSON.
public enum JSONDecodableError: Error {
	case parseError
}

/// JSONDecodable
///
/// Conform to this protocol if the data can be decode by json.
public protocol JSONDecodable {
	init(decodeWith json: JSON) throws
}

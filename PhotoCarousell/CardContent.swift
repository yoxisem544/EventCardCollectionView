//
//  CardContent.swift
//  PhotoCarousell
//
//  Created by David on 2016/10/19.
//  Copyright © 2016年 David. All rights reserved.
//

import Foundation

fileprivate struct Keys {
	static let id = "id"
	static let day = "day"
	static let name = "name"
	static let organizer = "organizer"
	static let featureImageURL = "feature_image_url"
	static let tags = "tags"
	static let attendees = "attendees"
	static let friends = "friends"
	static let others = "others"
	static let url = "url"
	static let urlExcerpt = "url_excerpt"
	static let excerpt = "excerpt"
	static let info = "info"
	struct location {
		static let address = "location_address"
		static let longtitude = "location_longitude"
		static let latitude = "location_latitude"
		static let supplement = "location_supplement"
	}
	static let startTime = "start_time"
	static let endTime = "end_time"
}

public struct CardContent {
	
	let id: Int
	let day: String
	let name: String
	let organizer: String
	let featureImageURL: String
	let tags: [CardTagContent]
	let attendees: [String]
	let others: String?
	let url: String?
	let urlExcerpt: String
	let excerpt: String
	let info: String?
	let location: (address: String?, supplement: String?, longtitude: Double?, latitude: Double?)
	let startTime: Date
	let endTime: Date
	
}

extension CardContent : JSONDecodable {
	
	public init(decodeWith json: JSON) throws {
		<#code#>
	}
	
}

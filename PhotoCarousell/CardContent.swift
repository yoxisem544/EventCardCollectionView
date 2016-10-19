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
	let attendeeImageURLs: [String]
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
		guard let id = json[Keys.id].int else { throw JSONDecodableError.parseError }
		guard let day = json[Keys.day].string else { throw JSONDecodableError.parseError }
		guard let name = json[Keys.name].string else { throw JSONDecodableError.parseError }
		guard let organizer = json[Keys.organizer].string else { throw JSONDecodableError.parseError }
		guard let featureImageURL = json[Keys.featureImageURL].string else { throw JSONDecodableError.parseError }
		guard let tags = json[Keys.].string else { throw JSONDecodableError.parseError }
		guard let attendees = json[Keys.].string else { throw JSONDecodableError.parseError }
		guard let friends = json[Keys.].string else { throw JSONDecodableError.parseError }
		guard let others = json[Keys.attendees][Keys.others].string else { throw JSONDecodableError.parseError }
		guard let url = json[Keys.url].string else { throw JSONDecodableError.parseError }
		guard let urlExcerpt = json[Keys.urlExcerpt].string else { throw JSONDecodableError.parseError }
		guard let excerpt = json[Keys.excerpt].string else { throw JSONDecodableError.parseError }
		guard let info = json[Keys.info].string else { throw JSONDecodableError.parseError }
		guard let address = json[Keys.location.address].string else { throw JSONDecodableError.parseError }
		guard let supplement = json[Keys.location.supplement].string else { throw JSONDecodableError.parseError }
		guard let longtitude = json[Keys.location.longtitude].string else { throw JSONDecodableError.parseError }
		guard let latitude = json[Keys.location.latitude].string else { throw JSONDecodableError.parseError }
		guard let startTime = Date.dateFrom(iso8601: json[Keys.startTime].string) else { throw JSONDecodableError.parseError }
		guard let endTime = Date.dateFrom(iso8601: json[Keys.endTime].string) else { throw JSONDecodableError.parseError }
		
	}
	
}

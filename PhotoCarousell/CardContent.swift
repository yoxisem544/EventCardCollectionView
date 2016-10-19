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
		guard let attendeeImageURLs = json[Keys.attendees][Keys.friends].arrayObject as? [String] else { throw JSONDecodableError.parseError }
		guard let urlExcerpt = json[Keys.urlExcerpt].string else { throw JSONDecodableError.parseError }
		guard let excerpt = json[Keys.excerpt].string else { throw JSONDecodableError.parseError }
		guard let startTime = Date.dateFrom(iso8601: json[Keys.startTime].string) else { throw JSONDecodableError.parseError }
		guard let endTime = Date.dateFrom(iso8601: json[Keys.endTime].string) else { throw JSONDecodableError.parseError }
		
		self.id = id
		self.day = day
		self.name = name
		self.organizer = organizer
		self.featureImageURL = featureImageURL
		self.tags = CardTagContent.generateTags(with: json[Keys.tags])
		self.attendeeImageURLs = attendeeImageURLs
		self.others = json[Keys.attendees][Keys.others].string
		self.url = json[Keys.url].string
		self.urlExcerpt = urlExcerpt
		self.excerpt = excerpt
		self.info = json[Keys.info].string
		self.location = (json[Keys.location.address].string,
		                 json[Keys.location.supplement].string,
		                 json[Keys.location.longtitude].double,
		                 json[Keys.location.latitude].double)
		self.startTime = startTime
		self.endTime = endTime
	}
	
}

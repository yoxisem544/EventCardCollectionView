//
//  CardContent.swift
//  PhotoCarousell
//
//  Created by David on 2016/10/19.
//  Copyright © 2016年 David. All rights reserved.
//

import Foundation

public struct CardContent {
	
	let id: Int
	let day: String
	let name: String
	let organizer: String
	let featureImageURL: String
	let tags: [String]
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

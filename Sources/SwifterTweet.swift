//
//  SwifterTweet.swift
//  Swifter
//
//  Created by Ben Gottlieb on 11/10/19.
//  Copyright © 2019 Matt Donnelly. All rights reserved.
//

import Foundation

extension Swifter {
	public struct Tweet: Codable {
		static var decoder: JSONDecoder {
			let decoder = JSONDecoder()
			let formatter = DateFormatter()
			formatter.dateFormat = "E MMM d HH:mm:ss Z yyyy"
			decoder.dateDecodingStrategy = .formatted(formatter)
			return decoder
		}

		public var id_str = ""
		public var is_quote_status = false
		public var source = ""
		public var user: User
		public var lang = ""
		public var favorite_count: UInt64
		public var retweet_count: UInt64
		public var favorited = false
		public var id: UInt64
		public var retweeted = false
		public var possibly_sensitive: Bool? = false
		public var text = ""
		public var entities: TweetEntities
		public var extended_entities: ExtendedEntity?
		public var truncated = false
		public var created_at: Date?

		
		public struct User: Codable {
			public var id: UInt64
			public var name = ""

			public var id_str = ""
			public var protected = false
			public var profile_sidebar_border_color: String? = ""
			public var profile_link_color: String? = ""
			public var favourites_count = 0.0
			public var profile_background_color: String? = ""
			public var profile_sidebar_fill_color: String? = ""
			public var profile_background_tile = false
			public var profile_image_url_https: String? = ""
			public var friends_count = 0
			public var entities: UserEntities?
			public var profile_background_image_url_https: String? = ""
			public var profile_image_url: String? = ""
			public var statuses_count = 0
			public var following = false
			public var default_profile = false
			public var listed_count = 0.0
			public var geo_enabled = false
			public var profile_use_background_image = false
			public var screen_name: String? = ""
			public var description: String? = ""
			public var followed_by: Bool? = false
			public var notifications = false
			public var contributors_enabled = false
			public var followers_count = 0
			public var has_extended_profile = false
			public var verified = false
			public var location: String? = ""
			public var created_at: Date?
			public var follow_request_sent = false
			public var profile_background_image_url: String? = ""
			public var profile_text_color: String? = ""
			
			public struct UserEntities: Codable  {
				public var description: Entity?
				public var url: Entity?
			}
		}
		
		public struct TweetEntities: Codable {
			public var hashtags: [Entity]
			public var symbols: [Entity]
			public var urls: [Entity]
			public var user_mentions: [Entity]
		}

	}
	
	public struct Entity: Codable {
		public var display_url: String? = ""
		public var indices: [Int]? = []
		public var expanded_url: String? = ""
		public var url: String? = ""
	}

	public struct ExtendedEntity: Codable {
		public var media: [Media]?
		
		public struct Media: Codable {
			public var media_url_https: String! = ""
			public var id: UInt64 = 0
			public var expanded_url: String! = ""
			public var media_url: String! = ""
			public var id_str = ""
			public var display_url: String! = ""
			public var type = ""
			public var sizes: Sizes
			public var indices: [Int] = []
			public var url = ""
			
			public struct Sizes: Codable {
				public var large: Size?
				public var medium: Size?
				public var small: Size?
				public var thumb: Size?
				
				public struct Size: Codable {
					public var h: Int
					public var w: Int
					public var resize: String
				}
			}
		}
	}
}

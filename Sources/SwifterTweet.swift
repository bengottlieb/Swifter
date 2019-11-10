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

		var id_str = ""
		var is_quote_status = false
		var source = ""
		var user: User
		var lang = ""
		var favorite_count: Int64
		var retweet_count: Int64
		var favorited = false
		var id: Int64
		var retweeted = false
		var possibly_sensitive: Bool? = false
		var text = ""
		var entities: TweetEntities
		var extended_entities: ExtendedEntity?
		var truncated = false
		var created_at: Date?

		
		struct User: Codable {
			var id: UInt64
			var name = ""

			var id_str = ""
			var protected = false
			var profile_sidebar_border_color: String? = ""
			var profile_link_color: String? = ""
			var favourites_count = 0.0
			var profile_background_color: String? = ""
			var profile_sidebar_fill_color: String? = ""
			var profile_background_tile = false
			var profile_image_url_https: String? = ""
			var friends_count = 0
			var entities: UserEntities?
			var profile_background_image_url_https: String? = ""
			var profile_image_url: String? = ""
			var statuses_count = 0
			var following = false
			var default_profile = false
			var listed_count = 0.0
			var geo_enabled = false
			var profile_use_background_image = false
			var screen_name: String? = ""
			var description: String? = ""
			var followed_by = false
			var notifications = false
			var contributors_enabled = false
			var followers_count = 0
			var has_extended_profile = false
			var verified = false
			var location: String? = ""
			var created_at: Date?
			var follow_request_sent = false
			var profile_background_image_url: String? = ""
			var profile_text_color: String? = ""
			
			struct UserEntities: Codable  {
				var description: Entity?
				var url: Entity?
			}
		}
		
		struct TweetEntities: Codable {
			var hashtags: [Entity]
			var symbols: [Entity]
			var urls: [Entity]
			var user_mentions: [Entity]
		}

	}
	
	struct Entity: Codable {
		var display_url: String? = ""
		var indices: [Int]? = []
		var expanded_url: String? = ""
		var url: String? = ""
	}

	struct ExtendedEntity: Codable {
		var media: [Media]?
		
		struct Media: Codable {
			var media_url_https: String! = ""
			var id: UInt64 = 0
			var expanded_url: String! = ""
			var media_url: String! = ""
			var id_str = ""
			var display_url: String! = ""
			var type = ""
			var sizes: Sizes
			var indices: [Int] = []
			var url = ""
			
			struct Sizes: Codable {
				var large: Size?
				var medium: Size?
				var small: Size?
				var thumb: Size?
				
				struct Size: Codable {
					var h: Int
					var w: Int
					var resize: String
				}
			}
		}
	}
}

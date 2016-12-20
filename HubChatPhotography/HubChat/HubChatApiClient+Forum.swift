//
//  HubChatApiClient+Forum.swift
//  HubChatPhotography
//
//  Created by Eralp Karaduman on 12/20/16.
//  Copyright © 2016 Super Damage. All rights reserved.
//

import Foundation

extension HubChatApiClient {

    enum ForumResourceKey: String {
        case photography
    }

    fileprivate func forumUrlString(forum: ForumResourceKey) -> String {

        let path = String(format: "/v1/forum/%@/", forum.rawValue)
        return baseURLString.appending(path)
    }

    fileprivate func forumPostsForForumId(forumId: String) -> String {

        let path = String(format: "/v1/forum/%@/post", forumId)
        return baseURLString.appending(path)
    }

    typealias FetchForumCompletionHandler = (HubChatApiClientError?, Forum?) -> Void

    typealias FetchForumPostsCompletionHandler = (HubChatApiClientError?, [Post]) -> Void

    func fetchForum(
        _ forum: ForumResourceKey,
        completionHandler: @escaping FetchForumCompletionHandler) -> URLSessionTask {

        let request = Request(
            method: .GET,
            urlString: forumUrlString(forum: .photography),
            jsonBody: nil,
            queryItems: nil
        )

        return fetchJSON(request: request) { result in

            switch result {
            case let .Success(json):

                if let forum = HubChatForum(withJsonObject: json) {

                    completionHandler(nil, forum)

                } else {

                    completionHandler(HubChatApiClientError.BadResponse, nil)
                }

            case let .Failure(error):

                completionHandler(error, nil)
            }
        }
    }

    func fetchPostsForForumId(
        _ forumId: String,
        limit: Int = 30,
        completionHandler: @escaping FetchForumPostsCompletionHandler) -> URLSessionTask {

        let request = Request(
            method: .GET,
            urlString: forumPostsForForumId(forumId: forumId),
            jsonBody: nil,
            queryItems: [
                URLQueryItem(
                    name: "limit",
                    value: String(limit)
                )
            ]
        )

        return fetchJSON(request: request) { result in

            switch result {
            case let .Success(json):

                var posts = [Post]()

                guard let postsJson = json["posts"] as? [Any] else {
                    completionHandler(HubChatApiClientError.BadResponse, [])
                    return
                }

                posts = postsJson.flatMap { HubChatPost(withJsonObject: $0) }

                completionHandler(nil, posts)

            case let .Failure(error):

                completionHandler(error, [])
            }

        }

    }

}

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

    fileprivate func forumPostsUrlString(forum: ForumResourceKey) -> String {

        return forumUrlString(forum: forum).appending("post/")
    }

    typealias FetchForumCompletionHandler = (HubChatApiClientError?, Forum?) -> Void

    typealias FetchForumPostsCompletionHandler = (HubChatApiClientError?, [Post]) -> Void

    func fetchForum(
        _ forum: ForumResourceKey,
        completionHandler: @escaping FetchForumCompletionHandler) -> URLSessionTask {

        let request = Request(
            method: .GET,
            urlString: forumUrlString(forum: .photography),
            jsonBody: nil
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

    func fetchForumPosts(
        _ forum: ForumResourceKey,
        completionHandler: @escaping FetchForumCompletionHandler) -> URLSessionTask {

        let request = Request(
            method: .GET,
            urlString: forumPostsUrlString(forum: .photography),
            jsonBody: nil
        )

        return fetchJSON(request: request)

    }

}

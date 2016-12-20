//
//  HubChatApiClient.swift
//  HubChatPhotography
//
//  Created by Eralp Karaduman on 12/20/16.
//  Copyright © 2016 Super Damage. All rights reserved.
//

import Foundation

class HubChatApiClient {

    let baseURLString = "https://api.hubchat.com"

    typealias RequestCompletionHandler = ((Result) -> Void)?

    enum Method: String {
        case GET = "GET"
        case POST = "POST"
    }

    struct Request {

        let method: Method
        let urlString: String
        var jsonBody: [String: Any?]? = nil

        var urlRequest: URLRequest {

            var request = URLRequest(url: URL(string: urlString)!)
            request.httpMethod = method.rawValue
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")

            if
            let jsonBody = jsonBody,
            let body = try? JSONSerialization.data(withJSONObject: jsonBody) {
                request.httpBody = body
            }

            return request
        }
    }

    enum Result {
        case Success(json: AnyObject)
        case Failure(error: HubChatApiClientError)
    }

    static let shared = HubChatApiClient()

    fileprivate let session: URLSession

    init() {
        self.session = URLSession(configuration: URLSessionConfiguration.default)
    }

    func fetchJSON(
        request: Request,
        withCompletionHandler completionHandler: RequestCompletionHandler = nil)
        -> URLSessionDataTask {

            let task = session.dataTask(with: request.urlRequest) { (data, response, error) in

                DispatchQueue.main.async {

                    guard let response = response as? HTTPURLResponse else {
                        completionHandler?(Result.Failure(error: .BadResponse))
                        return
                    }

                    guard error == nil else {
                        completionHandler?(Result.Failure(error: .Internal(internalError: error)))
                        return
                    }

                    guard let data = data else {
                        completionHandler?(Result.Failure(error: .BadResponse))
                        return
                    }

                    guard let json = try? self.parseJsonResponse(data: data) as AnyObject else {
                        completionHandler?(Result.Failure(error: .BadResponse))
                        return
                    }

                    guard response.statusCode == 200 else {

                        let error = HubChatApiClientError.BadStatus(status: response.statusCode)

                        completionHandler?(Result.Failure(error: error))
                        return
                    }

                    completionHandler?(Result.Success(json: json))
                }
            }

            task.resume()
            return task
    }

    private func parseJsonResponse(data: Data) throws -> [String: AnyObject]? {

        let json = try JSONSerialization.jsonObject(
            with: data,
            options: JSONSerialization.ReadingOptions.mutableContainers)
            as? [String: AnyObject]

        return json
    }

}

//
//  NetworkManager.swift
//  MealRecipeApp
//
//  Created by RASHID on 08/07/2026.
//

import Foundation
//
//  NetworkManager.swift
//  MealRecipeApp
//
//  Created by RASHID on 08/07/2026.
//

import Foundation

enum NetworkError: LocalizedError {

    case invalidURL
    case invalidResponse
    case invalidStatusCode(Int)
    case decodingError(Error)

    var errorDescription: String? {

        switch self {

        case .invalidURL:
            return "The URL is invalid."

        case .invalidResponse:
            return "The server returned an invalid response."

        case .invalidStatusCode(let code):
            return "Server returned status code \(code)."

        case .decodingError(let error):
            return "Failed to decode response: \(error.localizedDescription)"
        }
    }
}

final class NetworkManager {

    static let shared = NetworkManager()

    private init() {}

    func request<T: Decodable>(
        endpoint: APIEndpoints,
        type: T.Type
    ) async throws -> T {

        let url = endpoint.url

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }

        guard 200...299 ~= httpResponse.statusCode else {
            throw NetworkError.invalidStatusCode(httpResponse.statusCode)
        }

        do {

            let decoder = JSONDecoder()

            return try decoder.decode(T.self, from: data)

        } catch {

            throw NetworkError.decodingError(error)
        }
    }
}

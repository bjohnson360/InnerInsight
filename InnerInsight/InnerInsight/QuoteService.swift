//
//  QuoteService.swift
//  InnerInsight
//
//  Created by Brian Johnson on 11/20/23.
//

import Foundation

class QuoteService {
    static let shared = QuoteService()

    private init() {}

    func fetchQuote(completion: @escaping (Result<Quotes, Error>) -> Void) {
        guard let url = URL(string: "https://example.com/api/quote") else {
            completion(.failure(URLError(.badURL)))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(URLError(.unknown)))
                return
            }

            do {
                let quoteResponse = try JSONDecoder().decode(QuoteAPIResponse.self, from: data)
                let quote = Quotes(q: quoteResponse.q, a: quoteResponse.a)
                completion(.success(quote))
            } catch {
                completion(.failure(error))
            }
        }

        task.resume()
    }
}


// NetworkService.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Протокол  сетевых запросов
protocol NetworkServiceProtocol {
    func fetchMovies(completionHandler: @escaping (Result<[Movie], Error>) -> Void)
}

/// Сервис для выполнения сетевых запросов.
final class NetworkService: NetworkServiceProtocol {
    // MARK: - Constants

    enum Constants {
        static let scheme = "https"
        static let host = "api.kinopoisk.dev"
        static let path = "/v1.4/movie/search"
        static let queryKey = "query"
        static let queryValue = "история"
        static let authHeader = "X-API-KEY"
        static let authToken = "ZY0H144-PF2MNRP-K6JJS5M-55REHHW"
    }

    /// Параметры запроса
    let queryItems: [URLQueryItem] = [
        URLQueryItem(
            name: Constants.queryKey,
            value: Constants.queryValue
        )
    ]

    // MARK: - Public Methods

    /// Получение списка фильмов
    func fetchMovies(completionHandler: @escaping (Result<[Movie], Error>) -> Void) {
        let component: URLComponents = createURLComponents(
            scheme: Constants.scheme,
            host: Constants.host,
            path: Constants.path,
            queryItems: queryItems
        )

        guard let componentURL = component.url
        else { return }
        var request = URLRequest(url: componentURL)
        request.setValue(
            Constants.authToken,
            forHTTPHeaderField: Constants.authHeader
        )

        let urlSession = URLSession.shared
        urlSession.dataTask(
            with: request
        ) { data, _, error in
            if let error = error {
                completionHandler(.failure(error))
            } else if let data = data {
                do {
                    let moviesDTO = try JSONDecoder().decode(MoviesDTO.self, from: data)
                    let docs = moviesDTO.docs

                    var movies: [Movie] = []
                    for doc in docs {
                        movies.append(Movie(dto: doc))
                    }
                    completionHandler(.success(movies))
                } catch {
                    completionHandler(.failure(error))
                }
            }
        }.resume()
    }
}

// MARK: - Private Methods

/// Создание компонентов URL
private func createURLComponents(
    scheme: String,
    host: String,
    path: String,
    queryItems: [URLQueryItem]
) -> URLComponents {
    var component = URLComponents()
    component.scheme = scheme
    component.host = host
    component.path = path
    component.queryItems = queryItems
    return component
}

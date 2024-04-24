// Builder.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Контейнер для проставления зависимостей и сборки модулей
final class AppBuilder {
    // MARK: - Constants

    enum Constants {}

    // MARK: - Public Methods

    /// Создание модуля списка фильмов
    func makeMoviesListModule(coordinator: MoviesListCoordinator) -> MoviesViewController {
        let viewModel = MoviesViewModel()
        let view = MoviesViewController(moviesListViewModel: viewModel)
        return view
    }
}

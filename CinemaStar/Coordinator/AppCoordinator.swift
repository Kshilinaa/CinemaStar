// AppCoordinator.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Главный координатор приложения
final class AppCoordinator: BaseCoodinator {
    // MARK: - Private Properties

    private var appBuilder: AppBuilder

    // MARK: - Initializers

    init(appBuilder: AppBuilder) {
        self.appBuilder = appBuilder
    }

    // MARK: - Private Methods

    override func start() {
        goToMoviesList()
    }

    private func goToMoviesList() {
        let moviesListCoordinator = MoviesListCoordinator()
        let moviesListModuleView = appBuilder.makeMoviesListModule(
            coordinator: moviesListCoordinator
        )
        moviesListCoordinator.setViewController(controller: moviesListModuleView)
        moviesListCoordinator.onFinishFlow = { [weak self] in
            self?.remove(coordinator: moviesListCoordinator)
            self?.goToMoviesDetail()
        }
        guard let moviesListView = moviesListCoordinator.rootController else { return }
        add(coordinator: moviesListCoordinator)
        setAsRoot​(​_​: moviesListView)
    }

    private func goToMoviesDetail() {}
}

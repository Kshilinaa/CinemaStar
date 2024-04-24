// MoviesModel.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Модель для  экрана с библиотекой фильмов
struct Movie {
    /// Название изображения фильма
    let imageName: String?
    /// Название фильма
    let movieName: String?
    /// Рейтинг фильма
    let rating: Double?

    init(dto: Doc) {
        imageName = dto.poster.url
        movieName = dto.name
        rating = Double(String(format: "%.1f", dto.rating.kp)) ?? 0
    }
}

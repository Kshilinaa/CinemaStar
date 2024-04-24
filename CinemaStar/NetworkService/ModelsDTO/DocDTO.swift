// DocDTO.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// ДТО Модель из массива Doc
struct Doc: Codable {
    /// Идентификатор
    let id: Int
    /// Название
    let name: String
    /// Рейтинг
    let rating: Rating
    /// Постер
    let poster: Backdrop
}

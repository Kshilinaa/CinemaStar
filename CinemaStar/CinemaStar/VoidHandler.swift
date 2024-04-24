// VoidHandler.swift
// Copyright © RoadMap. All rights reserved.

//  Created by Ксения Шилина on 22.04.2024.
//
import Foundation

// Создаем типы для кложур
// swiftlint:disable all
public typealias VoidHandler = () -> Void
public typealias BoolHandler = (Bool) -> Void
public typealias StringHandler = (String) -> Void
public typealias DateHandler = (Date) -> Void
public typealias OptionalDateHandler = (Date?) -> Void
public typealias DataHandler = (Data) -> Void
// swiftlint:enable all

//
//  Pagination.swift
//
//
//  Created by Nouman Gul Junejo on 12/07/2024.
//

import Foundation

// MARK: - Pagination
public struct Pagination<T: Decodable>: Decodable {
    public let page, perPage, total, totalPages: Int
    public var data: [T]?
}

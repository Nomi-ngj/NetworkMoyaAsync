//
//  Pagination.swift
//
//
//  Created by Nouman Gul Junejo on 12/07/2024.
//

import Foundation

// MARK: - Pagination
public struct Pagination<T: Codable>: Codable {
    let page, perPage, total, totalPages: Int?
    var data: [T]?
}
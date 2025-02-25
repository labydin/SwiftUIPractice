//
//  BookModel.swift
//  BookstoreSU
//
//  Created by 박준영 on 11/27/24.
//

import Foundation

// MARK: - ResponsedBooks
struct ResponsedBooks: Codable{
    let meta: Meta
    let documents: [Document]
}

// MARK: - Document
struct Document: Codable, Hashable {
    var title: String
    var authors: [String]
    var contents: String
    var price: Int32
    var thumbnail: String

    enum CodingKeys: String, CodingKey {
        case authors, contents, price, thumbnail, title
    }
}

// MARK: - Meta
struct Meta: Codable {
    let isEnd: Bool
    let pageableCount, totalCount: Int

    enum CodingKeys: String, CodingKey {
        case isEnd = "is_end"
        case pageableCount = "pageable_count"
        case totalCount = "total_count"
    }
}

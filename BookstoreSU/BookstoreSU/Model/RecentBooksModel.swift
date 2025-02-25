//
//  RecentBooksModel.swift
//  BookstoreSU
//
//  Created by 박준영 on 11/29/24.
//

import Foundation
import SwiftData

@Model
class RecentBooks {
    var title: String
    var authors: [String]
    var contents: String
    var price: Int32
    var thumbnail: String
    var addedDate: Date?
    
    init(title: String, authors: [String], contents: String, price: Int32, thumbnail: String, addedDate: Date) {
        self.title = title
        self.authors = authors
        self.contents = contents
        self.price = price
        self.thumbnail = thumbnail
        self.addedDate = addedDate
    }
}

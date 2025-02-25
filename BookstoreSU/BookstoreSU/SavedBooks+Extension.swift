//
//  SavedBooks+Extension.swift
//  BookstoreSU
//
//  Created by 박준영 on 11/28/24.
//

import Foundation

extension SavedBooks {
    func toDocument() -> Document {
        return Document(title: self.title ?? "알 수 없는 제목", authors: self.author?.split(separator: ",").map { String($0) } ?? ["알 수 없는 저자"], contents: self.contents ?? "알 수 없는 내용", price: self.price, thumbnail: self.thumbnail!)
    }
}

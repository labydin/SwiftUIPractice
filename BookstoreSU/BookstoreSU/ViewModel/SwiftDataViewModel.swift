//
//  SwiftDataViewModel.swift
//  BookstoreSU
//
//  Created by 박준영 on 11/29/24.
//

import Foundation
import SwiftData

class SwiftDataViewModel: ObservableObject {
    
    @Published var recentBooks: [RecentBooks] = []
    let container: ModelContainer
    let context: ModelContext
    
    init() {
        self.container = try! ModelContainer(for: RecentBooks.self)
        self.context = ModelContext(container)
        self.context.undoManager = UndoManager()
        fetchBooks()
    }
    
    private func saveData() {
        do {
            try context.save()
            fetchBooks()
        } catch {
            print("Failed to save context: \(error)")
        }
    }
    
    func fetchBooks() {
        var descriptor = FetchDescriptor<RecentBooks>(
            predicate: nil, sortBy: [.init(\.addedDate, order: .reverse)])
        descriptor.fetchLimit = 10
        
        do {
            recentBooks = try context.fetch(descriptor)
        } catch {
            print("Failed to fetch books: \(error)")
        }
    }
    
    func addBook(title: String, authors: [String], contents: String, price: Int32, thumbnail: String) {
        let newBook = RecentBooks(title: title, authors: authors, contents: contents, price: price, thumbnail: thumbnail, addedDate: Date())
        context.insert(newBook)
        recentBooks.reverse()
        saveData()
    }
    
    func deleteBook(_ book: RecentBooks) {
        context.delete(book)
        saveData()
    }
    
    func deleteAllBooks() {
        do {
            let allBooks = try context.fetch(FetchDescriptor<RecentBooks>())
            for book in allBooks {
                context.delete(book)
            }
            saveData()
        } catch {
            print("Failed to fetch or delete books: \(error)")
        }
    }
    
    func performUndo() {
        context.undoManager?.undo()
        fetchBooks()
    }
    
    func performRedo() {
        context.undoManager?.redo()
        fetchBooks()
    }

}

//
//  CoreDataViewModel.swift
//  BookstoreSU
//
//  Created by 박준영 on 11/28/24.
//

import Foundation
import CoreData

class CoreDataViewModel: ObservableObject {
    
    let container: NSPersistentContainer
    @Published var savedBooks: [SavedBooks] = []
    
    init() {
        container = NSPersistentContainer(name: "SavedBooksModel")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("ERROR LOADING CORE DATA : \(error.localizedDescription)")
            }
        }
        fetchBooks()
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchBooks()
        } catch {
            print("ERROR SAVING CORE DATA : \(error.localizedDescription)")
        }
    }
    
    func fetchBooks() {
        let request = NSFetchRequest<SavedBooks>(entityName: "SavedBooks")
        do {
            savedBooks = try container.viewContext.fetch(request)
        } catch {
            print("ERROR FETCHING CORE DATA : \(error.localizedDescription)")
        }
    }
    
    func addBook(book: Document) {
        let books = SavedBooks(context: container.viewContext)
        books.title = book.title
        books.author = book.authors[0]
        books.thumbnail = book.thumbnail
        books.price = book.price
        books.contents = book.contents
        books.addedDate = Date()
        container.viewContext.insert(books)
        saveData()
    }
    
//    func deleteBook(item: SavedBooks) {
//        container.viewContext.delete(item)
//        saveData()
//    }
    
    func deleteBook(indexSet: IndexSet) {
         guard let index = indexSet.first else { return }
         let entity = savedBooks[index]
         container.viewContext.delete(entity)
         saveData()
     }
    
    func updateBook(entity: SavedBooks, book: Document) {
        entity.title = book.title
        entity.author = book.authors[0]
        entity.thumbnail = book.thumbnail
        entity.price = book.price
        entity.contents = book.contents
        saveData()
    }
    
    func deleteAllBooks() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "SavedBooks")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try container.viewContext.execute(deleteRequest)
            saveData()
        } catch {
            print("데이터 삭제 오류: \(error.localizedDescription)")
        }
    }
    
    func checkDuplication(title: String) -> Bool {
        return savedBooks.contains(where: {$0.title == title})
    }
    
    func sortByTitle() {
        savedBooks.sort{ ($0.title ?? "") < ($1.title ?? "") }
    }
    
    func sortByAddedDate() {
        savedBooks.sort { ($0.addedDate ?? Date.distantPast) > ($1.addedDate ?? Date.distantPast) }
    }
    
}

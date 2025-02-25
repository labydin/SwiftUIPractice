//
//  SavedListView.swift
//  BookstoreSU
//
//  Created by 박준영 on 11/25/24.
//

import SwiftUI

struct SavedListView: View {
    
    @EnvironmentObject private var viewModel: CoreDataViewModel
//    @FetchRequest(
//        entity: SavedBooks.entity(),
//        sortDescriptors: [NSSortDescriptor(keyPath: \SavedBooks.title, ascending: true)]
//    ) var savedBooks: FetchedResults<SavedBooks>
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.savedBooks, id: \.self) { book in
                    NavigationLink {
                        DetailView(book: Binding.constant(book.toDocument()))
                            .environmentObject(viewModel)
                    } label: {
                        BookListCellView(title: book.title ?? "알 수 없는 제목", authors: book.author ?? "알 수 없는 저자", price: book.price)
                    }
                }
                .onDelete(perform: { indexSet in
                    viewModel.deleteBook(indexSet: indexSet)
                })
            }
            
            .navigationTitle("담은 책")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("전체 삭제") {
                        viewModel.deleteAllBooks()
                    }
                    .foregroundColor(.gray)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Button {
                            viewModel.sortByAddedDate()
                        } label: {
                            Text("최신 순")
                            Image(systemName: "photo.stack.fill")
                        }
                        Button {
                            viewModel.sortByTitle()
                        } label: {
                            Text("가나다 순")
                            Image(systemName: "textformat")
                        }
                    } label: {
                        Image(systemName: "text.justify")
                    }

                }
            }
        }
        .onAppear {
            viewModel.fetchBooks()
        }
    }
}

//#Preview {
//    SavedListView()
//}

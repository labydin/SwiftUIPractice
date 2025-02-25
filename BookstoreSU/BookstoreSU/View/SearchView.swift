//
//  ContentView.swift
//  BookstoreSU
//
//  Created by 박준영 on 11/25/24.
//

import SwiftUI

struct SearchView: View {
    
    @EnvironmentObject var viewModel: SwiftDataViewModel
    @State var searchedBooks: [Document] = []
    @State var searchWord = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("최근 본 책")
                        .font(.title)
                    
                    Spacer()
                    
                    Button {
                        viewModel.deleteAllBooks()
                    } label: {
                        Text("초기화")
                    }
                }
                
                ScrollView(.horizontal) {
                    let gridItems = [GridItem(.flexible())]
                    LazyHGrid(rows: gridItems, spacing: 10) {
                        ForEach($viewModel.recentBooks, id: \.self) { book in
                            RecentBookGridCellView(thumnail: book.thumbnail, title: book.title)
                        }
                    }
                    .frame(height: UIScreen.main.bounds.height * 0.19)
                }
                
                HStack {
                    Spacer()
                    
                    Button(action: {
                        viewModel.performUndo()
                    }, label: {
                        Image(systemName: "arrowtriangle.backward")
                    })
                    
                    Button(action: {
                        viewModel.performRedo()
                    }, label: {
                        Image(systemName: "arrowtriangle.forward")
                    })
                }
            }
            .frame(width: UIScreen.main.bounds.width - 40)
            
            VStack(alignment: .leading, spacing: 10) {
                Spacer()
                
                Text("검색 결과")
                    .font(.title)
                
                List($searchedBooks, id: \.self) { book in
                    let b = book.wrappedValue
                    NavigationLink {
                        DetailView(book: book)
                            .environmentObject(viewModel)
                    } label: {
                        BookListCellView(title: b.title, authors: b.authors.first ?? "알 수 없는 저자", price: b.price)
                    }
                }
            }
        }
        .searchable(text: $searchWord)
        .onChange(of: searchWord) { _, word in
            Task {
                searchedBooks = await NetworkManager.shared.loadData(query: word)
            }
        }
        .onAppear {
            viewModel.fetchBooks()
        }
    }
}


#Preview {
    TabBarView()
}

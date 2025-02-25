//
//  DetailView.swift
//  BookstoreSU
//
//  Created by 박준영 on 11/25/24.
//

import SwiftUI

struct DetailView: View {
    
    @Environment(\.dismiss) var dismiss
    @Binding var book: Document
    @EnvironmentObject private var coreViewModel: CoreDataViewModel
    @EnvironmentObject private var swiftViewModel: SwiftDataViewModel
    @State private var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            Text(book.title)
                .font(.title)
            
            Text(book.authors.joined(separator: ", "))
                .foregroundColor(.gray)
            
            AsyncImage(url: URL(string: book.thumbnail), scale: 0.5)
            
            Text("\(book.price)원")
                .bold()
            
            Spacer()
            
            Text(book.contents)
        }
        
        HStack(spacing: 10) {
            Spacer(minLength: 10)
            
            Button("X") {
                dismiss()
            }
            .font(.title)
            .padding(.all, 8)
            .frame(width: (UIScreen.main.bounds.width - 40) * 0.25)
            .buttonStyle(.plain)
            .foregroundColor(.white)
            .background(Color.gray)
            .cornerRadius(16)
            .navigationBarBackButtonHidden(true)
            
            Button("담기") {
                if coreViewModel.checkDuplication(title: book.title) {
                    showAlert.toggle()
                } else {
                    coreViewModel.addBook(book: book)
                }
            }
            .font(.title)
            .padding(.all, 8)
            .frame(maxWidth: .infinity)
            .buttonStyle(.plain)
            .foregroundColor(.white)
            .background(Color.green)
            .cornerRadius(16)
            .alert("이미 담겨있는 책입니다.", isPresented: $showAlert) {
                Button("돌아가기", role: .cancel) {}
            }
            
            Spacer(minLength: 10)
        }
        .toolbar(.hidden, for: .tabBar)
        .toolbar(.hidden, for: .navigationBar)
        .onAppear {
            swiftViewModel.addBook(title: book.title, authors: book.authors, contents: book.contents, price: book.price, thumbnail: book.thumbnail)
        }
    }
    
}

//#Preview {
//    DetailView()
//}

//
//  ContentView.swift
//  ToDoListSU
//
//  Created by 박준영 on 10/10/24.
//

import SwiftUI


struct Memo: Identifiable {
    let id = UUID()
    var text: String
    var isOn = false
}


struct ContentView: View {
    
    @State private var memos: [Memo] = []
    @State private var showAddAlert = false
    @State private var showModifyAlert = false
    @State private var showDeleteAlert = false
    @State private var todo = ""
    @State private var modifiedTodo = ""
    @State private var tempMemo: Memo?
    //@State var tempText = ""
    
    
    var body: some View {
        VStack {
            Button {
                showAddAlert = true
            } label: {
                Text("추가하기")
                    .foregroundColor(.blue)
                    .padding(.horizontal)
            }
            .alert("할 일 추가", isPresented: $showAddAlert) {
                TextField("", text: $todo)
                Button("취소", role: .cancel) {}
                Button("추가", role: .none) {
                    let newMemo = Memo(text: todo, isOn: false)
                    memos.append(newMemo)
                    todo = ""
                }
            }
            
            List($memos) { $memo in
                HStack {
                    Text(memo.text)
                        .strikethrough(memo.isOn, color: .black)
                    
                    Spacer()
                    
                    Toggle("", isOn: $memo.isOn)
                    
                }
                .swipeActions(edge: .trailing) {
                    Button(role: .none) {
                        modifiedTodo = memo.text // 기존 텍스트를 수정할 텍스트로 설정
                        //tempText = memo.text
                        tempMemo = memo
                        showModifyAlert.toggle()
                    } label: {
                        Label("수정", systemImage: "pencil.line")
                    }
                    .tint(.green)
                    
                    Button(role: .none) {
                        tempMemo = memo
                        showDeleteAlert.toggle()
                    } label: {
                        Label("삭제", systemImage: "trash")
                    }
                    .tint(.red)
                }
                .alert("할 일 수정", isPresented: $showModifyAlert) {
                    TextField("", text: $modifiedTodo)
                    Button("취소", role: .cancel) {}
                    Button("수정", role: .none) {
//                        var i = memos.firstIndex { memo in
//                            memo.text == tempText
//                        }
//                        memos[i!].text = modifiedTodo
                        print(memo)
                        if let i = memos.firstIndex(where: { $0.id == tempMemo?.id }) {
                            memos[i].text = modifiedTodo
                        }
                    }
                }
                .alert("정말 삭제하시겠습니까?", isPresented: $showDeleteAlert) {
                    Button("취소", role: .cancel) {}
                    Button("삭제", role: .destructive) {
                        if let i = memos.firstIndex(where: { $0.id == tempMemo?.id }) {
                            memos.remove(at: i)
                        }
                    }
                }
                
            }
        }
    }
}


#Preview {
    ContentView()
}

//
//  TodoDetailView.swift
//  ToDo
//
//  Created by yuseong on 8/27/24.
//

import SwiftUI

struct TodoDetailView: View {
    @State var todo: Todo
    
    var body: some View {
        VStack{
            TextField("투두 타이틀",text: $todo.title)   //todo.title은 수정이 되는데 수정할거면 앞에 $를 써줘야함
                .font(.title2)
                .padding(5)
                .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 2))
            
            TextEditor(text: $todo.description)
                .padding(5)
                .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 2))
        }
        .padding()
        .navigationTitle("Edit Task 📝")
    }
}

#Preview {
    TodoDetailView(todo: Todo(title: "2번쨰 화면의 투두")) //이 화면에는 todo가 없기 떄문에 하나 만들어줌
}

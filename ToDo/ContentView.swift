//
//  ContentView.swift
//  ToDo
//
//  Created by yuseong on 7/28/24.
//

import SwiftUI

struct ContentView: View {
    //커밋용
    @State var todoList: [Todo] = [
        Todo(title: "친구만나기"),
        Todo(title: "과제제출하기"),
        Todo(title: "푹쉬기")
    ]
    
    func addTodo() {
        withAnimation{
            let newTodo = Todo(title: "새로운 투두")
            todoList.append(newTodo)
        }
    }
    
    func deleteTodo(indexSet: IndexSet){
        withAnimation{
            for index in indexSet{
                todoList.remove(at: index)
            }
        }
    }
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(todoList) { todo in
                    HStack{
                        if todo.isCompleted == true {
                            Image(systemName: "circle.fill")
                                .foregroundColor(Color.pink)
                                .onTapGesture {
                                    todo.isCompleted.toggle()
                                }
                        } else {
                            Image(systemName: "circle")
                                .foregroundColor(Color.pink)
                                .onTapGesture {
                                    todo.isCompleted.toggle()
                                }
                        }
                        
                        NavigationLink {
                            //다음화면의 뷰
                            TodoDetailView(todo: todo)  //  앞에todo는 todoDetailView의 todo고 뒤에 todo는 이페이지 for문 인자인 todo
                        } label: {
                            //현재화면
                            Text(todo.title)
                                .strikethrough(todo.isCompleted, color: Color.gray)
                                .foregroundStyle(todo.isCompleted ? Color.gray : Color.primary)
                        }
                    }
                    .listRowSeparator(.hidden)
                }
                .onDelete(perform: deleteTodo)
            }
            .listStyle(.plain)
            .navigationTitle("ToDo 🏓") //각각의 화면에 이름붙여줘야함
            .toolbar{
                ToolbarItem{
                    EditButton()
                }
                ToolbarItem{
                    Button(action:addTodo, label: {
                        Image(systemName: "plus")
                    })
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  ToDo
//
//  Created by yuseong on 7/28/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext   //이코드 없으면 조회만 가능, 있으면 생성 및 삭제 가능
    @Query var todoList: [Todo] = [ //스위프트데이터에서 쓸거야:Query
        Todo(title: "친구만나기"),
        Todo(title: "과제제출하기"),
        Todo(title: "푹쉬기")
    ]
    
    func addTodo() {
        withAnimation{
            let newTodo = Todo(title: "새로운 투두")
            //todoList.append(newTodo)    
            modelContext.insert(newTodo) //todoList에 직접접근X, 얘를 품고 있는 modelContext에 접근해야함
        }
    }
    
    func deleteTodo(indexSet: IndexSet){
        withAnimation{
            for index in indexSet{
                //todoList.remove(at: index)
                let todo = todoList[index]
                modelContext.delete(todo)
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

//
//  ListView.swift
//  TodoList
//
//  Created by Sams Tabrige on 8/7/23.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [ItemModel] = [
        ItemModel(title: "This is the first title!", isCompleted: false),
        ItemModel(title: "This the the second!", isCompleted: true),
        ItemModel(title: "Third!", isCompleted: false),
    ]
    
    var body: some View {
        List {
            ForEach(items) { items in
                ListRowView(item: items)
            }
            .onDelete(perform: deleteItem)
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Todo List 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add", destination: AddView())
        )
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ListView()
        }
    }
}

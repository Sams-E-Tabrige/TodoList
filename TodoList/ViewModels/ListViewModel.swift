//
//  ListViewModel.swift
//  TodoList
//
//  Created by Sams Tabrige on 8/10/23.
//

import Foundation

/*
 CRUD FUCNTIONS
 Create
 Read
 Update
 Delete
 */


class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    
    
    let itemsKey: String = "items"
    
    init() {
        getItems()
    }
    
    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        self.items = savedItems
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String){
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel){
        if let index = items.firstIndex(where: {  $0.id == item.id }){
            items[index] = item.updateCompletion()
        }
        
    }
    
    func saveItems() {
        if let encodedDate = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedDate, forKey: itemsKey)
        }
    }
    
}

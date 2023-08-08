//
//  itemModel.swift
//  TodoList
//
//  Created by Sams Tabrige on 8/7/23.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}

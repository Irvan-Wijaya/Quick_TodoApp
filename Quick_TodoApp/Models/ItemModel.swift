import Foundation

//  Identifiable -> protocol is used to uniquely identify objects within a collection, such as an array of items in a SwiftUI list. Helps SwiftUI track changes and efficiently update views when data changes.
//  Codable -> for encode and decode mechanism
//  because its immutable struct, we can only change through updateCompletion func, this approach to prevent accident with database
struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    // kenapa declare UUID nya di init supaya bisa di custom, untuk func add & update (u know what i mean)
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}

/*
With this approach, we have 2 option like these:
1. ItemModel(title: , isCompleted: ) -> used for when create a new Item, because it will generate new ID
2. ItemModel(id: , title: , isCompleted:) -> used for update existing item without change the ID or create new ID
 
 Why?, Because when create new item it generate new ID, when update we need called the ItemModel to change the title or the isCompleted status, but that case automatically generate new other ID. So its like duplicate but different ID, hope this clearly.
*/

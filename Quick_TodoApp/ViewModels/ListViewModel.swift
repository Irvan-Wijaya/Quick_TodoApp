import Foundation

class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = []
    
    init () {
        getItem()
    }
    
    func getItem() {
        let newItem = [
            ItemModel(title: "Learn SwiftUI", isCompleted: false),
            ItemModel(title: "Learn Swift", isCompleted: true),
            ItemModel(title: "Learn MVVM", isCompleted: false)
        ]
        // if multiple items, using contentOf
        items.append(contentsOf: newItem)
    }
    
    func deleteItem (indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem (from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false) // because its new set to false as default
        items.append(newItem)
    }
}

import Foundation

/**
1. ObservableObject -> Jika ada perubahan pada data di dalam objek yang menerapkan ObservableObject, tampilan yang bergantung padanya akan secara otomatis diperbarui.
2. @Published -> property wrapper yang digunakan di dalam objek ObservableObject untuk memberi tahu tampilan jika nilai properti terjadi perubahan maka perbarui tampilannya.
3. EnvirontmentObject -> property wrapper di SwiftUI yang digunakan menyebarkan ObservableObject ke seluruh tampilan aplikasi secara otomatis tanpa perlu meneruskan secara manual.
*/

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
        let newItem = ItemModel(title: title, isCompleted: false) // because it's new set false as default
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
        // $0 represents each element in the items array that is being checked.
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
    }
}

/**
 Personal note:
 $ is Shorthand Argument Name, Simplify closure that uses a small number of parameters.
 
 let numbers = [1, 2, 3, 4, 5]
 let result = numbers.filter { number in number > 2 }
 print(result)  // Output: [3, 4, 5]

 With Shorthand
 let numbers = [1, 2, 3, 4, 5]
 let result = numbers.filter { $0 > 2 }
 print(result)  // Output: [3, 4, 5]
 */

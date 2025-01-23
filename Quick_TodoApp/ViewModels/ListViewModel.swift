import Foundation

/**
1. ObservableObject -> Jika ada perubahan pada data di dalam objek yang menerapkan ObservableObject, tampilan yang bergantung padanya akan secara otomatis diperbarui.
2. @Published -> property wrapper yang digunakan di dalam objek ObservableObject untuk memberi tahu tampilan jika nilai properti terjadi perubahan maka perbarui tampilannya.
3. @EnvirontmentObject -> property wrapper di SwiftUI yang digunakan menyebarkan ObservableObject ke seluruh tampilan aplikasi secara otomatis tanpa perlu meneruskan secara manual.
*/

class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = [] {
        // anytime we change the items array this function will get called | this approach more efficient than add saveItem to each function (CRUD)
        didSet{
            saveItem()
        }
    }
    
    let itemsKey: String = "items_list"
    
    init () {
        getItem()
    }
    
    func getItem() {
//  guard let data = UserDefaults.standard.data(forKey: itemsKey) else { return }
//  guard let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data) else { return }
        
        // for more readbility
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data) // -> decode to what from where
        else { return }
        
        self.items = savedItems
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
    
    func saveItem () {
        if let encodeData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodeData, forKey: itemsKey) // -> encode what to where, (jsonKey)
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

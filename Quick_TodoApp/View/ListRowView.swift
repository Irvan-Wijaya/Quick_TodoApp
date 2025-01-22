import SwiftUI

struct ListRowView: View {
    let title: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: title.isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundColor(title.isCompleted ? .green : .blue)
            Text(title.title)
            Spacer()
        }
        // why im set the font at the HStack, so both Image and the text updated with this settings
        .font(.title2)
        .padding(.vertical, 8)
//        .accessibilityElement(children: .combine)
//        .accessibilityLabel("\(title.title), \(title.isCompleted ? "completed" : "not completed")")
    }
}

#Preview {
    var item1 = ItemModel(title: "Testing 1", isCompleted: true)
    var item2 = ItemModel(title: "Testing 2", isCompleted: false)
    
    Group {
        ListRowView(title: item1)
        ListRowView(title: item2)
    }
}

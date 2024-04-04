import SwiftUI

struct TabTitleBar: View {
    @Binding var currentTabSelection: Int
    let tabItems: [TabItem]
    
    
    /// An HStack that animates between the currently selected item and the next selected item
    /// - Parameters:
    ///   - currentTabSelection: Binding<Int> that will determine which item is active / inactive
    ///   - tabItems: An Array of TabItems, an Object that
    init(currentTabSelection: Binding<Int>, tabItems: [TabItem]) {
        _currentTabSelection = currentTabSelection
        self.tabItems = tabItems
    }
    
    var body: some View {
        HStack {
            ForEach(tabItems) { item in
                item.view
                    .modifier(TabTitleModifier(currentTabSelection: $currentTabSelection, targetIndex: item.index))
            }
        }
    }
}

#Preview {
    ExampleView()
}

struct ExampleView: View {
    @State var tabSelection: Int = 0
    
    var tabItems: [TabItem] {
        let item1 = TabItem(view: Text("Item 1"), index: 0)
        let item2 = TabItem(view: Text("Item 2"), index: 1)
        let item3 = TabItem(view: Text("Item 3"), index: 2)
        
        return [item1, item2, item3]
    }
    
    var body: some View {
        VStack {
            TabTitleBar(
                currentTabSelection: $tabSelection,
                tabItems: tabItems
            )
            
            HStack {
                Button("1") {
                    tabSelection = 0
                }
                .buttonStyle(.borderedProminent)
                
                Button("2") {
                    tabSelection = 1
                }
                .buttonStyle(.borderedProminent)
                
                Button("3") {
                    tabSelection = 2
                }
                .buttonStyle(.borderedProminent)
            }
        }
    }
}

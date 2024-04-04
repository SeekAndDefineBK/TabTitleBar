# SwiftUI Tab Title Bar
A SwiftUI view that contains an HStack of Text views and animates those views to large or small based on if their respective tab is active. 

This is a component that is initialized with a current index value and an array of Tab Items. Tab Items are a struct that contains a view and a target index. 

Tab Item conforms to identifiable with a UUID predefined, however you can assign your own UUID should you so choose. 

This is a component that was pulled out of my app Resolute to be shared as an open source package. Version 1.0 focuses on being a component built specifically for Resolute, however as time goes on I look forward to making it much more flexible. 

# Demo
<p align="center">
    <img src="TabTitleBar-Demo.gif" alt="Demo of Tab Title Bar" width="420" height="60" />
</p>

# Scope
- Ultimately, this is a list of items in an HStack.
- The currentTabSelection a `Binding<Int>`
- TabItem contains the following.
    - An index, this is used to determine if the view is currently selected. 
    - A Text view, this is the view that will animate between the active and inactive state. 
- The states as of 1.0 are defined as follows.
    - Active: Font Size of 24 with a foreground color of .primary.
    - Inactive: Font Size of 12 with a foreground color of .secondary.

# Usage Example
```
struct ExampleView: View {
    @State var tabSelection: Int = 0
    
    var tabItems: [TabItem] {
        let item1 = TabItem(view: Text("Item 1"), index: 0)
        let item2 = TabItem(view: Text("Item 2"), index: 1)
        let item3 = TabItem(view: Text("Item 3"), index: 2)
        
        return [item1, item2, item3]
    }
    
    var body: some View {
        TabTitleBar(
            currentTabSelection: $tabSelection,
            tabItems: tabItems
        )
    }
}
```

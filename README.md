# SwiftUI Modal View Modifier

This is an example on how to present a fullscreen "modal" in `SwiftUI` using a custom `ViewModifier` to simplify the process. 

#### Result

![SwiftUI with custom modal ViewModifier](https://github.com/piterwilson/SwiftUI-FullscreenModalViewModifier/raw/master/images/demo.gif)

## Background

At the moment of writting, `SwiftUI` provides no good way to present a fullscreen modal. The different approaches are explored in this repository: https://github.com/piterwilson/SwiftUI-Modal-on-iPad/

The technique explored in this repository focuses on creating a `View` that is inserted/removed replacing the parent `View` content using a `Bool`, which is equivalent to what is demonstrated here: https://github.com/piterwilson/SwiftUI-Modal-on-iPad/tree/master/iPadConditionalViewModal

## Sample Basic Implementation

```
struct ContentView: View {
    @State private var showModal = false
    var body: some View {
        ZStack {
            Color.white
            VStack(spacing: 10.0) {
                Button(action: {
                    withAnimation(.easeOut(duration: 0.25)) {
                        self.showModal = true
                    }
                }, label: {
                    Text("Open Modal")
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.blue, lineWidth: 1)
                    )
                })
            }
        }
        .modal(isPresented: $showModal) {
            Button(action: {
                    withAnimation(.easeOut(duration: 0.25)) {
                        self.showModal = false
                    }
                }, label: {
                    Text("Close Modal")
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.blue, lineWidth: 1)
                    )
                })
        }
    }
}
```
## Advantages

* Presents a fullscreen modal using `SwiftUI`
* Nice syntax, makes it possible to append multiple `modal` instances to a "base" view in a relatively clean way.

## Disadvantages

* Doesn't work if the base view is embeded in a NavigationView root unless the its navigation bar is hidden
* Doesn't work if the base view is embeded in a NavigationView child, that is a View presented using NavigationLink unless the its navigation bar and back button are hidden
* In general it ceases to be a fullscreen modal when the modifier is added to a `View` that is not the root `View` in a given layout.

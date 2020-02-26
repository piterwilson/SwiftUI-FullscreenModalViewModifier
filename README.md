# SwiftUI Modal View Modifier

This is an example on how to present a fullscreen "modal" in `SwiftUI` using a custom `ViewModifier` to simplify the process. 

#### Result

![SwiftUI with custom modal ViewModifier](https://github.com/piterwilson/SwiftUI-FullscreenModalViewModifier/raw/master/images/demo.gif)

## Background

At the moment of writting, `SwiftUI` provides no good way to present a fullscreen modal. The different approaches are explored in this repository: https://github.com/piterwilson/SwiftUI-Modal-on-iPad/

The technique explored in this repository focuses on creating a `View` that is inserted/removed on the parent `View` body using a `Bool`, which is equivalent to what is demonstrated here: https://github.com/piterwilson/SwiftUI-Modal-on-iPad/tree/master/iPadConditionalViewModal



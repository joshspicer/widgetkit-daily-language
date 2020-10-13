# widgetkit-daily-italian
Learn a new language with a new (Italian) word-a-day!

Written with SwiftUI, this project utilizes iOS 14's WidgetKit to display a simple, at-a-glance widget with a randomly selected Italian <-> English pair (for now).

Used in conjunction with [this simple Azure functions api](https://github.com/joshspicer/italian_api).

<img width=350px src="./img.png"/>

# Usage
Create a new file at `DailyItalianWord/Secrets.swift` with your API key from above.

```swift
//  secrets.swift

import Foundation


struct Secrets {
    static let URI = "YOUR_AZURE_API"
}
```

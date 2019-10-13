# Card Navigation Controller

![Gif](https://imgur.com/xTUeRHi.gif)

## Installation

### Swift Package Manager

```
dependencies: [
    .package(url: "https://github.com/withplum/CardNavigationController", from: "1.0.0")
]
```

## Usage

`CardNavigationController` has a very similar API to `UINavigationController`.

### Presentation

To present a `CardNavigationController`:

```
let viewController = YourViewController()
let cardNavigationController = CardNavigationController(rootViewController: viewController)
self.present(cardNavigationController, animated: false, completion: nil)
```

### Dismissing

To dismiss a `CardNavigationController`:

```
cardNavigationController.dismiss(animated: true)
```

If you wish to dissmiss the `CardNavigationController` from within a view controller that is currently being presented by the `CardNavigationController` a getter has been extended onto `UIViewController`:

```
internal final class ExampleViewController: UIViewController
{
    //...
    // Some code
    //...
    
    // MARK: Actions
    
    @objc private func doneButtonTapped(_ sender: Any)
    {
        self.cardNavigationController?.dismiss(animated: true)
    }
}
```

### Pushing

Pushing a view controller onto the stack is exactly the same as `UINavigationController`.

```
internal final class ExampleViewController: UIViewController
{
    //...
    // Some code
    //...
    
    // MARK: Actions
    
    @objc private func doneButtonTapped(_ sender: Any)
    {
        let controller = SuccessViewController()
        self.cardNavigationController?.pushViewController(controller, animated: true)
    }
}
```

### Popping

...and so is popping

```
internal final class ExampleViewController: UIViewController
{
    //...
    // Some code
    //...
    
    // MARK: Actions
    
    @objc private func backButtonTapped(_ sender: Any)
    {
        self.cardNavigationController?.popViewController(animated: true)
    }
}
```


### UI Customisation

To customise the appearence of the `CardNavigationController` your view controllers should conform to the `CardNavigationControllerAppearance` protocol.

```
public protocol CardNavigationControllerAppearance
{
    var actionButtons: [UIButton] { get }
    var closeButtonHidden: Bool { get }
}


// MARK: Defaults

public extension CardNavigationControllerAppearance
{
    var actionButtons: [UIButton] { return [] }
    var closeButtonHidden: Bool { return true }
}
```

#### Action Buttons Example

![Action button examble](https://i.imgur.com/3lzTUbk.png)

#### Close Button Example

![Close button example](https://i.imgur.com/J7fsRda.png)

## License

MIT

Copyright 2019 Plum Fintech Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

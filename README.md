# PixieSticks

Under 200 lines of extension code on UIView and NSLayoutConstraint and basically all of the benefits of the bigger libraries.

- Exposes the same semantics of AutoLayout through UIView.
- Makes AutoLayout easier to use through sensible defaults.
- Doesn’t infer intent.
- Small enough you should consider copy pasting it.

PureLayout:

```swift
view.autoSetDimension(.height, toSize: 22)
imageView.autoPinEdge(.leading, to: .leading, of: view)
imageView.autoAlignAxis(.horizontal, toSameAxisOf: view)
locationLabel.autoAlignAxis(.horizontal, toSameAxisOf: imageView)
locationLabel.autoPinEdge(.leading, 
                          to: .trailing, of: imageView, withOffset: 5)
```

PixieSticks:

```swift
view.constrain(attribute: .height, constant: 22)
imageView.constrain(to: view, attribute: .leading)
imageView.constrain(to: view, attribute: .centerX)
locationLabel.constrain(to: imageView, attribute: .centerX)
locationLabel.constrain(attribute: .leading, 
                        to: imageView, attribute: .trailing, constant: 5)
```

## Author

PLJNS, me@pljns.com

## License

PixieSticks is available under the MIT license. See the LICENSE file for more info.

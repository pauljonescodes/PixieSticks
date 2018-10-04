//
//  UIViewExtensions.swift
//  ConstraintSugar
//
//  Created by Paul Jones on 9/19/18.
//

public extension UIView {
    
    /// Sets `translatesAutoresizingMaskIntoConstraints` to false
    convenience init(forAutoLayout: ()) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    /// Constrain this view to another view on a single attribute.
    ///
    /// - Parameters:
    ///   - item: The other view
    ///   - sharedAttribute: The attribute you want these views to share
    ///   - relation: The relation that attribute should have
    ///   - multiplier: The multiplier for the attribute
    ///   - constant: The constant for the attribute, "offset".
    /// - Returns: The layout constraint, not usually needed.
    @objc @discardableResult func constrain(to item: UIView? = nil,
                                            attribute sharedAttribute: NSLayoutAttribute,
                                            relatedBy relation: NSLayoutRelation = .equal,
                                            multiplier: CGFloat = 1,
                                            constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self,
                                  attribute: sharedAttribute,
                                  relatedBy: relation,
                                  toItem: item,
                                  multiplier: multiplier,
                                  constant: constant,
                                  isActive: true)
    }
    
    /// Constrain this view's attribute to another view's attribute
    ///
    /// - Parameters:
    ///   - attr1: Your view's attribute
    ///   - item: The other view
    ///   - attr2: The other view's attribute
    ///   - relation: The relation that attribute should have
    ///   - multiplier: The multiplier for the attribute
    ///   - constant: The constant for the attribute, "offset".
    /// - Returns: The layout constraint, not usually needed.
    @objc @discardableResult func constrain(attribute attr1: NSLayoutAttribute,
                                            to item: UIView,
                                            attribute attr2: NSLayoutAttribute,
                                            relatedBy relation: NSLayoutRelation = .equal,
                                            multiplier: CGFloat = 1,
                                            constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self,
                                  attribute: attr1,
                                  relatedBy: relation,
                                  toItem: item,
                                  attribute: attr2,
                                  multiplier: multiplier,
                                  constant: constant,
                                  isActive: true)
    }
    
    /// Constrain to superview's shared attribute
    ///
    /// - Parameters:
    ///   - sharedAttribute: The shared attribute
    ///   - relation: The relation that attribute should have
    ///   - multiplier: The multiplier for the attribute
    ///   - constant: The constant for the attribute, "offset".
    /// - Returns: The constraint, not usually needed, if superview exists
    @objc @discardableResult func constrainToSuperview(attribute sharedAttribute: NSLayoutAttribute,
                                                       relatedBy relation: NSLayoutRelation = .equal,
                                                       multiplier: CGFloat = 1,
                                                       constant: CGFloat = 0) -> NSLayoutConstraint? {
        guard let superview = superview else { return nil }
        return constrain(to: superview,
                         attribute: sharedAttribute,
                         relatedBy: relation,
                         multiplier: multiplier,
                         constant: constant)
    }
    
    /// Constrain to a superview's attribute
    ///
    /// - Parameters:
    ///   - attr1: Your attribute
    ///   - relation: The relation that attribute should have
    ///   - attr2: The superview's attribute
    ///   - multiplier: The multiplier for the attribute
    ///   - constant: The constant for the attribute, "offset".
    /// - Returns: The constraint, not usually needed, if superview exists
    @objc @discardableResult func constrainToSuperviews(attribute attr1: NSLayoutAttribute,
                                                        relatedBy relation: NSLayoutRelation = .equal,
                                                        toAttribute attr2: NSLayoutAttribute,
                                                        multiplier: CGFloat = 1,
                                                        constant: CGFloat = 0) -> NSLayoutConstraint? {
        guard let superview = superview else { return nil }
        return constrain(attribute: attr2,
                         to: superview,
                         attribute: attr1,
                         relatedBy: relation,
                         multiplier: multiplier,
                         constant: constant)
    }
    
    /// Constraint to shared attributes, creating multiple constraints.
    ///
    /// - Parameters:
    ///   - item: The view to constrain to
    ///   - sharedAttributes: The attributes you want these views to share.
    ///   - relation: The relation that attribute should have
    ///   - multiplier: The multiplier for the attribute
    ///   - constant: The constant for the attribute, "offset".
    /// - Returns: The constraints, not usually needed
    @discardableResult func constrain(to item: UIView,
                                      attributes sharedAttributes: [NSLayoutAttribute],
                                      relatedBy relation: NSLayoutRelation = .equal,
                                      multiplier: CGFloat = 1,
                                      constant: CGFloat = 0) -> [NSLayoutConstraint] {
        return sharedAttributes.map({ constrain(to: item,
                                                attribute: $0,
                                                relatedBy: relation,
                                                multiplier: multiplier,
                                                constant: constant) })
    }
    
    /// Constrain to an item using edge insets, a convienience.
    ///
    /// - Parameters:
    ///   - item: The item to constrain to
    ///   - edgeInsets: The edge insets you want to use to build constraints
    ///   - relation: The relation that attribute should have
    ///   - multiplier: The multiplier for the attribute
    ///   - margin: To the margin or not?
    /// - Returns: The constraints, not usually needed
    @objc @discardableResult func constrain(to item: UIView,
                                            edgeInsets: UIEdgeInsets = .zero,
                                            relatedBy relation: NSLayoutRelation = .equal,
                                            multiplier: CGFloat = 1,
                                            margin: Bool = false) -> [NSLayoutConstraint] {
        return [constrain(to: item,
                          attribute: margin ? .topMargin : .top,
                          relatedBy: relation,
                          multiplier: multiplier,
                          constant: edgeInsets.top),
                constrain(to: item,
                          attribute: margin ? .leftMargin : .left,
                          relatedBy: relation,
                          multiplier: multiplier,
                          constant: edgeInsets.left),
                constrain(to: item,
                          attribute: margin ? .rightMargin : .right,
                          relatedBy: relation,
                          multiplier: multiplier,
                          constant: -edgeInsets.right),
                constrain(to: item,
                          attribute: margin ? .bottomMargin : .bottom,
                          relatedBy: relation,
                          multiplier: multiplier,
                          constant: -edgeInsets.bottom)]
    }
    
    /// Constrain to superview using edge insets, a convienience.
    ///
    /// - Parameters:
    ///   - edgeInsets: The edge insets you want the subview to have.
    ///   - relation: The relation that attribute should have
    ///   - multiplier: The multiplier for the attribute
    ///   - margin: To the margin or not?
    /// - Returns: The constraints, not usually needed
    @objc @discardableResult func constrainToSuperview(edgeInsets: UIEdgeInsets = .zero,
                                                       relatedBy relation: NSLayoutRelation = .equal,
                                                       multiplier: CGFloat = 1,
                                                       margin: Bool = false) -> [NSLayoutConstraint] {
        guard let superview = superview else { return [] }
        return [constrain(to: superview,
                          attribute: margin ? .topMargin : .top,
                          relatedBy: relation,
                          multiplier: multiplier,
                          constant: edgeInsets.top),
                constrain(to: superview,
                          attribute: margin ? .leftMargin : .left,
                          relatedBy: relation,
                          multiplier: multiplier,
                          constant: edgeInsets.left),
                constrain(to: superview,
                          attribute: margin ? .rightMargin : .right,
                          relatedBy: relation,
                          multiplier: multiplier,
                          constant: -edgeInsets.right),
                constrain(to: superview,
                          attribute: margin ? .bottomMargin : .bottom,
                          relatedBy: relation,
                          multiplier: multiplier,
                          constant: -edgeInsets.bottom)]
    }
    
    /// Constrain to multiple attributes on the superview
    ///
    /// - Parameters:
    ///   - attributes: The attributes you want these views to share
    ///   - relation: The relation that attribute should have
    ///   - multiplier: The multiplier for the attribute
    ///   - constant: The constant for the attribute
    /// - Returns: The constraints, not usually needed
    @discardableResult func constrainToSuperview(attributes: [NSLayoutAttribute],
                                                 relatedBy relation: NSLayoutRelation = .equal,
                                                 multiplier: CGFloat = 1,
                                                 constant: CGFloat = 0) -> [NSLayoutConstraint] {
        guard let superview = superview else { return [] }
        return constrain(to: superview,
                         attributes: attributes,
                         relatedBy: relation,
                         multiplier: multiplier,
                         constant: constant)
    }
    
    /// A convienice that allows you to size a view with constraints using CGSize
    ///
    /// - Parameters:
    ///   - size: The size you want
    ///   - relation: The relation that attribute should have
    ///   - multiplier: The multiplier for the attribute
    /// - Returns: The constraint, not usually needed
    @objc @discardableResult func constrain(with size: CGSize,
                                            relatedBy relation: NSLayoutRelation = .equal,
                                            multiplier: CGFloat = 1) -> [NSLayoutConstraint] {
        return [constrain(attribute: .height, relatedBy: relation, multiplier: multiplier, constant: size.height),
                constrain(attribute: .width, relatedBy: relation, multiplier: multiplier, constant: size.width)]
    }
    
}

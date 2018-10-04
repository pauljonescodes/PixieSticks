//
//  NSLayoutConstraintExtensions.swift
//  ConstraintSugar
//
//  Created by Paul Jones on 9/19/18.
//

public extension NSLayoutConstraint {
    
    convenience init(item view1: Any,
                     attribute sharedAttribute: NSLayoutAttribute = .notAnAttribute,
                     relatedBy relation: NSLayoutRelation = .equal,
                     toItem view2: Any? = nil,
                     multiplier: CGFloat = 1,
                     constant c: CGFloat = 0,
                     isActive: Bool = false) {
        self.init(item: view1,
                  attribute: sharedAttribute,
                  relatedBy: relation,
                  toItem: view2,
                  attribute: sharedAttribute,
                  multiplier: multiplier,
                  constant: c)
        self.isActive = isActive
    }
    
    convenience init(item view1: Any,
                     attribute attr1: NSLayoutAttribute = .notAnAttribute,
                     relatedBy relation: NSLayoutRelation = .equal,
                     toItem view2: Any? = nil,
                     attribute attr2: NSLayoutAttribute,
                     multiplier: CGFloat = 1,
                     constant: CGFloat,
                     isActive: Bool = false) {
        self.init(item: view1,
                  attribute: attr1,
                  relatedBy: relation,
                  toItem: view2,
                  attribute: attr2,
                  multiplier: multiplier,
                  constant: constant)
        self.isActive = isActive
    }
    
}

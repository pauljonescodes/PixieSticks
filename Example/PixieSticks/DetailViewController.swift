//
//  DetailViewController.swift
//  ConstraintSugar_Example
//
//  Created by Paul Jones on 9/19/18.
//

import UIKit
import PixieSticks

class DetailViewController: UIViewController {
    
    var index: Int = 0
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let view1 = UIView(forAutoLayout: ())
        view1.backgroundColor = .blue
        let view2 = UIView(forAutoLayout: ())
        view2.backgroundColor = .red
        
        switch index {
        case 0:
            view.addSubview(view1)
            view.addSubview(view2)
            
            view1.constrain(attribute: .height, constant: 100)
            view1.constrain(attribute: .width, constant: 100)
            view1.constrain(to: view, attribute: .centerX)
            view1.constrain(to: view, attribute: .centerY)
            view2.constrain(to: view1, attribute: .left, constant: 10)
            view2.constrain(to: view1, attribute: .centerY)
            view1.constrain(to: view2, attribute: .right, constant: 20)
            view2.constrain(attribute: .height, constant: 40)
        case 1:
            view.addSubview(view1)
            view.addSubview(view2)
            view1.constrain(with: CGSize(width: 100, height: 100))
            
            view1.constrain(attribute: .centerX, to: view, attribute: .centerX)
            view1.constrain(attribute: .centerY, to: view, attribute: .centerY)
            view2.constrain(attribute: .left, to: view1, attribute: .right, constant: 10)
            view2.constrain(attribute: .top, to: view1, attribute: .bottom, constant: 10)
            view2.constrain(attribute: .height, to: view1, attribute: .height, constant: -50)
            view2.constrain(attribute: .width, to: view1, attribute: .width, constant: -50)
            
        case 2:
            view.addSubview(view1)
            
            view1.constrainToSuperview(attribute: .left, constant: 10)
            view1.constrainToSuperview(attribute: .right, constant: -20)
            view1.constrainToSuperview(attribute: .topMargin, constant: 30)
            view1.constrainToSuperview(attribute: .bottom, constant: -40)
        case 3:
            view.addSubview(view1)
            
            view1.constrainToSuperviews(attribute: .centerY, toAttribute: .top)
            view1.constrainToSuperviews(attribute: .width, toAttribute: .width, constant: -50)
            view1.constrainToSuperviews(attribute: .bottom, toAttribute: .bottom, constant: -100)
            view1.constrainToSuperviews(attribute: .left, toAttribute: .left, constant: 10)
        case 4:            
            view.addSubview(view1)
            view.addSubview(view2)
            
            view1.constrain(with: CGSize(width: 100, height: 100))
            view1.constrainToSuperview(attributes: [.centerX, .centerY])
            view2.constrain(to: view1, attributes: [.left, .top], constant: 10)
            view1.constrain(to: view2, attributes: [.right, .bottom], constant: 10)
        case 5:
            view.addSubview(view1)
            
            view1.constrain(to: view, edgeInsets: UIEdgeInsets(top: 10, left: 20, bottom: 30, right: 40), margin: true)
        case 6:
            view.addSubview(view1)
            
            view1.constrainToSuperview(edgeInsets: UIEdgeInsets(top: 10, left: 20, bottom: 30, right: 40), margin: true)
        case 7:
            view.addSubview(view1)
            
            view1.constrainToSuperview(attributes: [.height, .width], multiplier: 0.5)
            view1.constrainToSuperview(attributes: [.centerX, .centerY])
        case 8:
            view.addSubview(view1)
            
            view1.constrainToSuperview(attributes: [.centerX, .centerY])
            view1.constrain(with: CGSize(width: 100, height: 100))
        default:
            ()
        }
    }
}

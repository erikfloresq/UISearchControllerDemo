//
//  ReusableView.swift
//  UISearchControllerDemo
//
//  Created by Erik Flores on 17/01/18.
//  Copyright © 2018 Orbis. All rights reserved.
//

import UIKit

protocol ReusableView: class {

}

extension ReusableView where Self: UIView {
    static var defaultReuseIdentifer: String {
        return String(describing: self)
    }
}

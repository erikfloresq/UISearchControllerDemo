//
//  UITableView.swift
//  UISearchControllerDemo
//
//  Created by Erik Flores on 17/01/18.
//  Copyright © 2018 Orbis. All rights reserved.
//

import UIKit

extension UITableView {

    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T where T:ReusableView {
        guard let cell = dequeueReusableCell(withIdentifier: T.defaultReuseIdentifer, for: indexPath) as? T else {
            fatalError("No se puede utilizar la celda con el identidicador: \(T.defaultReuseIdentifer)")
        }
        return cell
    }

}

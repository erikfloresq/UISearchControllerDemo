//
//  ResultsViewController.swift
//  UISearchControllerDemo
//
//  Created by Erik Flores on 16/01/18.
//  Copyright © 2018 Orbis. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var resultsTableView: UITableView!
    var results: [Verb] = [] {
        didSet {
            resultsTableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        resultsTableView.dataSource = self
    }

}

extension ResultsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ResultTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.resultDescription.text = results[indexPath.row].baseForm
        return cell
    }

}

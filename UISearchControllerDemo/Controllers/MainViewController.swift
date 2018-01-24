//
//  MainViewController.swift
//  UISearchControllerDemo
//
//  Created by Erik Flores on 16/01/18.
//  Copyright © 2018 Orbis. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var verbsTableView: UITableView!
    var verbs: [Verb] = [] {
        didSet {
            verbsTableView.reloadData()
        }
    }
    lazy var resultViewController: UIViewController = {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let resultView = storyboard.instantiateViewController(withIdentifier: "ResultsViewController")
        guard let resultViewController = resultView as? ResultsViewController else {
            fatalError("Problems with viewController")
        }
        return resultViewController
    }()
    lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: resultViewController)
        searchController.dimsBackgroundDuringPresentation = true
        searchController.hidesNavigationBarDuringPresentation = true
        searchController.searchResultsUpdater = self
        return searchController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.verbs = Verb.getVerbsFromJSON("verbs")
        verbsTableView.dataSource = self
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.definesPresentationContext = true
    }


}

extension MainViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return verbs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: VerbTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.baseForm.text = verbs[indexPath.row].baseForm
        return cell
    }

}

extension MainViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else {
            return
        }
        let whiteSpaces = CharacterSet.whitespaces
        let strippedString = searchText.trimmingCharacters(in: whiteSpaces)
        let searchVerbs = strippedString.components(separatedBy: " ") as [String]

        let matchPredicate: [NSPredicate] = searchVerbs.map { searchVerb in
            var searchVerbsPredicate = [NSPredicate]()
            let baseFormExpression = NSExpression(forKeyPath: "baseForm")
            let searchStringExpression = NSExpression(forConstantValue: searchVerb)

            let verbSearchComparisonPredicate = NSComparisonPredicate(
                                                    leftExpression: baseFormExpression,
                                                    rightExpression: searchStringExpression,
                                                    modifier: .direct,
                                                    type: .contains,
                                                    options: .caseInsensitive)
            searchVerbsPredicate.append(verbSearchComparisonPredicate)
            let matchPredicate = NSCompoundPredicate(orPredicateWithSubpredicates: searchVerbsPredicate)
            return matchPredicate
        }

        let finalCompoundPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: matchPredicate)
        let filteredResults = verbs.filter { finalCompoundPredicate.evaluate(with: $0) }

        if let resultView = searchController.searchResultsController as? ResultsViewController {
            resultView.results = filteredResults
        }
    }
}


//
//  SearchResultsTableViewController.swift
//  iTunesSearch
//
//  Created by Enayatullah Naseri on 6/11/19.
//  Copyright © 2019 Enayatullah Naseri. All rights reserved.
//

import UIKit

class SearchResultsTableViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var segmentSwitch: UISegmentedControl!
    //    @IBOutlet weak var segmentSwitch: UISegmentedControl!
    @IBOutlet weak var searchBar: UISearchBar!
    

    let searchResultController = SearchResultController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResultController.searchResults.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "iTunesSearchCell", for: indexPath)
        
        let mediaItem = searchResultController.searchResults[indexPath.row]
        cell.textLabel?.text = mediaItem.title
        cell.detailTextLabel?.text = mediaItem.creator
        
        return cell
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text else { return }
        
        let segmentIndex = segmentSwitch.selectedSegmentIndex
        var resultType: ResultType!
        
        switch (segmentIndex) {
        case 0:
            resultType = .software
        case 1:
            resultType = .musicTrack
        default:
            resultType = .movie
        }
        
        searchResultController.performSearch(searchTerm: searchTerm, resultType: resultType) { (error) in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        
    }

}

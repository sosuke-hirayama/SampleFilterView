//
//  MainViewController.swift
//  SampleFilterView
//
//  Created by Sosuke Hirayama on 2017/09/06.
//  Copyright © 2017年 Sosuke Hirayama. All rights reserved.
//

import UIKit
import ASJTagsView

class MainViewController: UITableViewController {
    
    @IBOutlet weak var tagsView: ASJTagsView!
    let searchResults = ["検索結果1", "検索結果2", "検索結果3", "検索結果4", "検索結果5", "検索結果6", "検索結果7", "検索結果8", "検索結果9", "検索結果10", "検索結果11", "検索結果12", "検索結果13", "検索結果14", "検索結果15", "検索結果16", "検索結果17", "検索結果18", "検索結果19", "検索結果20"]
    let selectedFilter = ["条件1", "条件2", "条件3"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // setup searchbar
        let searchBar = UISearchBar()
        searchBar.placeholder = "キーワードでさがす"
        navigationItem.titleView = searchBar
        
        // setup tagview
        tagsView.tagColor = UIColor.lightGray
        for filter in selectedFilter {
            tagsView.addTag(filter)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchResultCell", for: indexPath)
        cell.textLabel?.text = searchResults[indexPath.row]
        return cell
    }

}

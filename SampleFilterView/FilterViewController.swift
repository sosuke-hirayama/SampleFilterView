//
//  FilterViewController.swift
//  SampleFilterView
//
//  Created by Sosuke Hirayama on 2017/09/06.
//  Copyright © 2017年 Sosuke Hirayama. All rights reserved.
//

import UIKit

class FilterViewController: UITableViewController {

    let filterList = ["条件1", "条件2", "条件3", "条件4", "条件5", "条件6", "条件7", "条件8", "条件9", "条件10", "条件11", "条件12", "条件13", "条件14", "条件15", "条件16", "条件17", "条件18", "条件19", "条件20"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilterCell", for: indexPath)
        cell.textLabel?.text = filterList[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func clickClose(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

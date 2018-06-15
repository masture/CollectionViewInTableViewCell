//
//  ViewController.swift
//  CollectionViewInTableViewCell
//
//  Created by Pankaj Kulkarni on 15/06/18.
//  Copyright © 2018 Pankaj Kulkarni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let teams = ["RCB", "MI", "DD", "CSK", "KRK"]
    let players = ["Rohit", "Virat", "Dhoni", "Dinesh", "Ajinkya"]
    var tableData = [[String]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableData = [teams, players]
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

// MARK - UITableViewDataSource

extension ViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if let cell = tableView.dequeueReusableCell(withIdentifier: "LabelTableViewCell", for: indexPath) as? LabelTableViewCell {
            cell.label.text = tableData[indexPath.section][indexPath.row]
            return cell
        }
        cell.textLabel?.text = tableData[indexPath.section][indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData[section].count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return (section == 0 ? "Teams" : "Players")
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        let footerString = "Total \(section == 0 ? "Teams" : "Players") are \(tableData[section].count)"
        return footerString
    }
    
    
}

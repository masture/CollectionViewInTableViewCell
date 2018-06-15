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
        // 1st Solution
//        if let cell = tableView.dequeueReusableCell(withIdentifier: "LabelTableViewCell", for: indexPath) as? LabelTableViewCell {
//            cell.label.text = tableData[indexPath.section][indexPath.row]
//            return cell
//        }
        // 2nd Solution
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionTableViewCell", for: indexPath) as? CollectionTableViewCell {
            
            cell.collectionView.tag = indexPath.section
            cell.collectionView.dataSource = self
            return cell
            
        }
        cell.textLabel?.text = tableData[indexPath.section][indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 1st Soluion
//        return tableData[section].count
        // 2nd Solution
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return (section == 0 ? "Teams" : "Players")
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        let footerString = "Total \(section == 0 ? "Teams" : "Players") are \(tableData[section].count)"
        return footerString
    }
    
}



extension ViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (tableData[collectionView.tag].count)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LabelCollectionViewCell", for: indexPath) as? LabelCollectionViewCell {
            
            cell.label.text = tableData[collectionView.tag][indexPath.row]
            return cell
        }
        
        return UICollectionViewCell()
        
    }
    
    
}

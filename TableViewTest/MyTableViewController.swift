//
//  MyTableViewController.swift
//  TableViewTest
//
//  Created by CAUADC on 2017. 2. 2..
//  Copyright © 2017년 CAUADC. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController {
    
    let names: [[String:Any]] = [
        ["name": "소프트웨어코딩과적용", "num":60],
        ["name": "SW프로젝트", "num":38],
        ["name": "통계프로그래밍(1)", "num":45],
        ["name": "마이크로컴퓨터시스템", "num":71],
        ["name": "창의ICT공학설계입문", "num":35],
        ["name": "게임아트와 내러티브", "num":35],
        ["name": "소프트웨어프로젝트", "num":76],
        ["name": "알기쉬운뇌과학", "num":200],
        ["name": "기초컴퓨터프로그래밍", "num":27]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return names.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell
        
        if indexPath.section == 1 {
            cell = tableView.dequeueReusableCell(withIdentifier: "OrangeCellIdentifier", for: indexPath)
        }
        else {
            cell = tableView.dequeueReusableCell(withIdentifier: "MyCellIdentifier", for: indexPath)
        }

        // Configure the cell...
        if let name = names[indexPath.row]["name"] as? String, let num = names[indexPath.row]["num"] as? Int {
            cell.textLabel?.text = name + " (총인원:\(num))"
            
            var txt: String = ""
            let Anum: Int = Int(Double(num) * 0.35)
            let Bnum: Int = Int(Double(num) * 0.7)
            let Cnum: Int = Int(Double(num) * 0.9)
            
            txt = "A컷 : \(Anum)등, B컷 : \(Bnum)등, C컷 : \(Cnum)등"
            
            cell.detailTextLabel?.text = txt
        }
        
        return cell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "과목 리스트"
    }
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "총 과목수 : \(names.count)"
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

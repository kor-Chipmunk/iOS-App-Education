//
//  ViewController.swift
//  ImagesTable
//
//  Created by CAUADC on 2017. 2. 6..
//  Copyright © 2017년 CAUADC. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var photoInfos: Results<PhotoInfo>?
    
    @IBAction func deleteData(_ sender: Any) {
        let realm = try? Realm()
        
        try? realm?.write {
            realm?.deleteAll()
            self.tableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let realm = try? Realm()
        self.photoInfos = realm?.objects(PhotoInfo.self)
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photoInfos?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ImageTableViewCell
        
        if let photoInfo = self.photoInfos?[indexPath.row] {
            cell.titlelabel?.text = photoInfo.title
            if let image = photoInfo.imageData {
                cell.imageView?.contentMode = .scaleAspectFit
                cell.imageview?.image = UIImage(data: image)
            }
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy.MM.dd hh:mm:ss"
            cell.desclabel?.text = dateFormatter.string(from: photoInfo.savedDate)
        }
        
        return cell 
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextViewController = segue.destination as? AddImageViewController,
            let selectedIndex = self.tableView.indexPathForSelectedRow,
                let photoInfo = self.photoInfos?[selectedIndex.row] {
            nextViewController.photoInfoFromPrevController = photoInfo
        }
    }
    
}


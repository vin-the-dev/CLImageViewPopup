//
//  ViewController.swift
//  CLImageViewPopup
//
//  Created by Vineeth Vijayan on 05/01/2016.
//  Copyright (c) 2016 Vineeth Vijayan. All rights reserved.
//

import UIKit
import CLImageViewPopup

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Table View
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "imagecell", for: indexPath)
        return cell
    }
}

class ImageCell: UITableViewCell {
    
}

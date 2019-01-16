//
//  ViewController.swift
//  Booking and Invoicing for Trainers
//
//  Created by Anton Huisamen on 2019/01/16.
//  Copyright © 2019 antonsolo. All rights reserved.
//

import UIKit

class ClientsViewController: UIViewController {
    
    @IBOutlet weak var clientListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clientListTableView.delegate = self
        clientListTableView.dataSource = self
    }
}

extension ClientsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = clientListTableView.dequeueReusableCell(withIdentifier: "clientListCell", for: indexPath)
        let nameLabel = cell.contentView.viewWithTag(1)as! UILabel
        nameLabel.text = "frikkie"
        return cell
    }
    
    
}

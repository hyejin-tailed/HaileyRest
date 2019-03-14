//
//  HMainViewController_UITableView.swift
//  haileyRest
//
//  Created by hailey on 3/13/19.
//  Copyright © 2019 hailey. All rights reserved.
//

import UIKit

extension HMainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HMainTableViewCell", for: indexPath) as! HMainTableViewCell
        cell.configCell(title: viewModel.title, content: viewModel.content)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension
    }
    
}

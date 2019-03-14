//
//  MainViewController.swift
//  haileyRest
//
//  Created by hailey on 3/13/19.
//  Copyright © 2019 hailey. All rights reserved.
//
import UIKit

class HMainViewController: UIViewController {

    @IBOutlet var mainTableView: UITableView!{
        didSet {
            
            let refreshControl = UIRefreshControl()
            mainTableView.refreshControl = refreshControl
            refreshControl.addTarget(self, action: #selector(request), for: .valueChanged)

        }
    }
    
    var viewModel : HMainViewControllerModel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        viewModel = HMainViewControllerModel()
        
        request()
        
        
    }

    
    @objc func request() {
        
        
        DispatchQueue.main.async { [weak self] in
            self?.mainTableView.refreshControl?.beginRefreshing()
        }

        
        viewModel.requestDetailCommon(completed: { [weak self] (data) in

            guard let _data = data else {
                return
            }
            
            if let title = _data["title"] {
                self?.viewModel.title = String(describing: title)
            }
            
            if let content = _data["overview"] {
                self?.viewModel.content = String(describing: content)
            }
            
            
            DispatchQueue.main.async {
                self?.mainTableView.reloadData()
                self?.mainTableView.refreshControl?.endRefreshing()
            }
            
        })
        
        
    }
    

}


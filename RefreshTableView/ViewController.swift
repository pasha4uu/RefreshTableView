//
//  ViewController.swift
//  RefreshTableView
//
//  Created by PASHA on 29/11/18.
//  Copyright © 2018 Pasha. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
 
  @IBOutlet weak var TBV: UITableView!
  
  var isAscending:Bool = true
  
   let refresh = UIRefreshControl()
  var names:[String] = ["ABC","BCD","CDE","DEF","EFG","FGH","GHI","HIJ","IJK","JKL","KLA","LAB"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    TBV.delegate =  self
    TBV.dataSource = self
    refresh.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
     self.TBV.refreshControl = refresh
    TBV.reloadData()
    // Do any additional setup after loading the view, typically from a nib.
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return names.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = names[indexPath.row]
    if isAscending {
      if indexPath.row % 2 == 0 {
        cell.textLabel?.backgroundColor = .blue
      }
      else
      {
        cell.textLabel?.backgroundColor = .red
      }
      return cell
    }
    else
    {
    if indexPath.row % 2 == 0 {
       cell.textLabel?.backgroundColor = .red
    }
    else
    {
       cell.textLabel?.backgroundColor = .blue
    }
    return cell
      
    }
  }
  
  @objc func pullToRefresh() {
    let sorted = names.reversed()
    for (index,value) in sorted.enumerated() {
      names[index] = value
    }
    TBV.reloadData()
    self.TBV.refreshControl?.endRefreshing()
    isAscending = !isAscending
  
  }
}


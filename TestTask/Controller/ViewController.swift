//
//  ViewController.swift
//  TestTask
//
//  Created by Матвей on 29.05.2022.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    var elements: [String] = []
    var data = [Datum]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func getData() {
        AF.request("https://pryaniky.com/static/json/sample.json")
            .validate()
            .responseDecodable(of: Welcome.self) { (response) in
                guard let data = response.value else { return }
                self.elements = data.view
                self.data = data.data
                self.tableView.reloadData()
            }
    }
    
    @IBAction func didTapSegmented(_ sender: Any) {
        self.tableView.reloadData()
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.elements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if elements[indexPath.row] == "hz" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as! TextTableViewCell
            cell.configure(with: data.first!)
            return cell
        }
        if elements[indexPath.row] == "picture" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath) as! ImageTableViewCell
            cell.configure(with: data[1])
            return cell
        }
        if elements[indexPath.row] == "selector" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SelectorCell", for: indexPath) as! SelectorTableViewCell
            cell.configure(with: data[2])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if elements[indexPath.row] == "hz" {
            return 80
        }
        if elements[indexPath.row] == "picture" {
            return 180
        }
        if elements[indexPath.row] == "selector" {
            return 100
        }
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        tableView.reloadData()
    }
    
    
}


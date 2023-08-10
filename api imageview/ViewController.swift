//
//  ViewController.swift
//  api imageview
//
//  Created by Admin on 09/08/23.
//

import UIKit

struct root: Codable{
    var login: String?
    var id: Int?
    var node_id: String?
    var url: String?
    var repos_url: String?
    var events_url: String?
    var hooks_url: String?
    var avatar_url: String?
}

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return json?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "table cell",for: indexPath)as! TableViewCell
        if let image = json?[indexPath.row].avatar_url{
            let url = URL(string: image)
            let data = try?Data(contentsOf: url!)
            cell.image1.image = UIImage(data: data!)
        }
        else{
            cell.image1.image = UIImage(named: "img")
        }
        
        //let url = URL(string: (json![indexPath.row].avatar_url!))
        //let data = try?Data(contentsOf: url!)
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    
    
    
    override func viewDidLoad() {
        getdata()
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    var json : [root]?
    
    
    @IBOutlet weak var tableview: UITableView!
    
    func getdata(){
        let url = URL(string: "https://api.github.com/users/hadley/orgs")
        let task = URLSession.shared.dataTask(with: url!){
            (data,response,error) in
            do{
                let content = try? JSONDecoder().decode([root].self, from: data!)
                self.json = content
                DispatchQueue.main.async {
                    self.tableview.reloadData()
                }
            }catch{
                print(error)
            }
        }
        task.resume()
    }
    
}





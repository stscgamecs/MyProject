//
//  ViewController.swift
//  MyProjectTestGit
//
//  Created by Z64me on 8/8/2562 BE.
//  Copyright © 2562 Z64me. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    @IBOutlet weak var tabelViewShow: UITableView!
    var arrayUser:[Joke] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btn_Get(_ sender: Any) {
        ApiManager().getRandomJoke { [weak self] (joke) in
            DispatchQueue.main.sync {
                guard let joke = joke else {
                    return
                }
                self?.nameLabel.text = joke.tags[0]
                
                self?.dateLabel.text = joke.appeared_at
                
            }
        }
       
    }
    @IBAction func btn_Add(_ sender: Any) {
        
        if let newDateLabel = dateLabel.text,let newNamelable = nameLabel.text,!newDateLabel.isEmpty,!newNamelable.isEmpty{
            let newJoke: Joke = Joke(appeared_at: newDateLabel,tags: [newNamelable])
            arrayUser.append(newJoke)
            dateLabel.text = nil
            nameLabel.text = nil
            print(arrayUser)
        
            
            tabelViewShow.reloadData()
            
            
        }
    }
    
    
    
    
    

}

extension ViewController:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayUser.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tabelViewShow.dequeueReusableCell(withIdentifier: "tablecell") as? newTableViewCell
        let data = arrayUser[indexPath.row]
        
        cell?.setupUI(Joke: data)
//        cell?.labelCell.text = "\(arrayUser[indexPath.row])"
        return cell!
    }
    
}

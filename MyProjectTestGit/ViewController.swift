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

extension ViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(arrayUser.count)
        return arrayUser.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tabelViewShow.dequeueReusableCell(withIdentifier: "tablecell") as? newTableViewCell
        let data = arrayUser[indexPath.row]
        
        cell?.setupUI(Joke: data)
        return cell!
    }
}

extension ViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main",bundle: nil)
        
        guard let detailViewController = storyboard.instantiateViewController(withIdentifier: "tableViewDetail") as?  DetailNewViewController else{
            return
        }
        let item1 = arrayUser[indexPath.item].appeared_at
        let item2 = arrayUser[indexPath.item].tags[0]
        
        detailViewController.setTitle(title: item1, title2: item2)
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            
            let alert = UIAlertController(title: "You want to delete this cell", message: "Delete", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler:{action in
                self.arrayUser.remove(at: indexPath.row)
                self.tabelViewShow.deleteRows(at:[indexPath], with: .fade)
            }))
            alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
            
            self.present(alert, animated: true)
        }
    }
}

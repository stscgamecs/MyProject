//
//  DetailNewViewController.swift
//  MyProjectTestGit
//
//  Created by Z64me on 12/8/2562 BE.
//  Copyright © 2562 Z64me. All rights reserved.
//

import UIKit




class DetailNewViewController: UIViewController {

    @IBOutlet weak var DateLabel: UILabel!
    
    @IBOutlet weak var NameLabel: UILabel!
    
    var newDateLabel:String!
   
    @IBAction func Btn_BackPage(_ sender: Any) {
         self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       // DateLabel.text = newDateLabel
        // Do any additional setup after loading the view.
    }
    
    func setTitle(title: String,title2: String){
       DateLabel.text = title
        NameLabel.text = title2
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

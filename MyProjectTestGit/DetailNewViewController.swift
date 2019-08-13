//
//  DetailNewViewController.swift
//  MyProjectTestGit
//
//  Created by Z64me on 12/8/2562 BE.
//  Copyright © 2562 Z64me. All rights reserved.
//

import UIKit




class DetailNewViewController: UIViewController {

    @IBOutlet weak var collectionViewData: UICollectionView!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    //var newDateLabel:String!
    
    
    private var titleUpdate1: String?
    private var titleUpdate2: String?
    let dataImg:[UIImage] = [UIImage(named: "barrafina")!,
                             UIImage(named: "bourkestreetbakery")!,
                             UIImage(named: "cafedeadend")!,
                             UIImage(named: "cafeloisl")!,
                             UIImage(named: "cafelore")!,
                             UIImage(named: "cafelore")!]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateLabel.text = titleUpdate1
        nameLabel.text = titleUpdate2
    }
    
    func setTitle(title: String,title2: String){
        self.titleUpdate1 = title
        self.titleUpdate2 = title2
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "nextPage",
            let viewControllor = segue.destination as? ViewControllerShowImg{
            
            viewControllor.setImg(img: sender as! UIImage )
        }
    }

}

extension DetailNewViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataImg.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let imgRecive = dataImg[indexPath.item]
        self.performSegue(withIdentifier: "nextPage", sender: imgRecive)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        

        
        let cell = collectionViewData.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as? customCollectionViewCell
        //let img = dataImg[indexPath.row]
        let name = (nameLabel?.text)!
        cell?.setItem(img: dataImg[indexPath.item],text: name)
        
        return cell!
    }
    
    
    
}



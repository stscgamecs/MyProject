//
//  customCollectionViewCell.swift
//  MyProjectTestGit
//
//  Created by Z64me on 13/8/2562 BE.
//  Copyright © 2562 Z64me. All rights reserved.
//

import UIKit

class customCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var imgViewShow: UIImageView!
    @IBOutlet weak var textLabeltest: UILabel!
    
    func setItem(img:UIImage,text:String){
        imgViewShow?.image = img
        textLabeltest.text = text
    }
    
}

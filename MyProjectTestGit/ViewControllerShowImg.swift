//
//  ViewControllerShowImg.swift
//  MyProjectTestGit
//
//  Created by Z64me on 13/8/2562 BE.
//  Copyright © 2562 Z64me. All rights reserved.
//

import UIKit

class ViewControllerShowImg: UIViewController {

    @IBOutlet weak var imgShow: UIImageView!
    var im : UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgShow.image = im
        // Do any additional setup after loading the view.
    }
    func setImg(img:UIImage){
        im = img
    }

    
}

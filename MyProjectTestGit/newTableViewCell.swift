//
//  newTableViewCell.swift
//  MyProjectTestGit
//
//  Created by Z64me on 11/8/2562 BE.
//  Copyright © 2562 Z64me. All rights reserved.
//

import UIKit

class newTableViewCell: UITableViewCell {

    @IBOutlet weak var labelCell: UILabel!
    
    @IBOutlet weak var nameLabelCell: UILabel!
    
    
    var todoItem: Joke!
    
    func setupUI(Joke:Joke){
        labelCell.text = Joke.appeared_at
        nameLabelCell.text = Joke.tags[0]
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

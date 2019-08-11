//
//  TodoItemUItableTableViewCell.swift
//  MyProjectTestGit
//
//  Created by Z64me on 10/8/2562 BE.
//  Copyright © 2562 Z64me. All rights reserved.
//

import Foundation

protocol TodoItemTableViewCellDelegate :class {
    func didcheckTodoItem(cell:TodoItemUItableTableViewCell)
}

class TodoItemUItableTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var todoItemImgeView: UIImageView!
    @IBOutlet weak var todoItemTitle: UILabel!
    
    var tapGestureRegcognizer: UITapGestureRecognizer!
    var delegate: TodoItemTableViewCellDelegate?
    var todoItem: TodoItem!
    
    func setupUI(todoItem: TodoItem){
        todoItemTitle.text = todoItem.string
        
        if todoItem.ischecked{
            todoItemImgeView.image = #imageLiteral(resourceName: "posatelier")
        }else{
            todoItemImgeView.image = #imageLiteral(resourceName: "checkfalse")
        }
        
        tapGestureRegcognizer = UITapGestureRecognizer(target: self, action: #selector(todoImageViewTapped(sender:)))
        todoItemImgeView.addGestureRecognizer(tapGestureRegcognizer)
    }
    @objc func todoImageViewTapped(sender: Any){
        delegate?.didcheckTodoItem(cell: self)
    }
    
}

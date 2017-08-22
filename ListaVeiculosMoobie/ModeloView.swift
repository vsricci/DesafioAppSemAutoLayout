//
//  ModeloView.swift
//  ListaVeiculosMoobie
//
//  Created by Vinicius on 21/08/17.
//  Copyright © 2017 Vinicius. All rights reserved.
//

import UIKit

class ModeloView: UIView {
    
    var tituloLabel : UILabel = UILabel()
    var tableView : UITableView = UITableView()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("hgjghjhgjh")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        iniciaLayout()
    }
    
    
    func iniciaLayout(){
        
        tituloLabel.frame = CGRect(x: 0, y: 8, width: 300, height: 30)
        tituloLabel.textAlignment = .center
        tituloLabel.clipsToBounds = true
        tituloLabel.font = UIFont.boldSystemFont(ofSize: 30)
        
        
        tableView.frame = CGRect(x: 0, y: tituloLabel.frame.maxY, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        tableView.clipsToBounds = true
        tableView.rowHeight = 100
        
        
        addSubview(tituloLabel)
        addSubview(tableView)
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

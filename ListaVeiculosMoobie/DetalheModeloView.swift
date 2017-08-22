//
//  DetalheModeloView.swift
//  ListaVeiculosMoobie
//
//  Created by Vinicius on 22/08/17.
//  Copyright © 2017 Vinicius. All rights reserved.
//

import UIKit

class DetalheModeloView: UIView {
    
    var label1 : UILabel = UILabel()
    var label2 : UILabel = UILabel()
    var label3 : UILabel = UILabel()
    var labelTabelaFibe : UILabel = UILabel()
    var labelMarca : UILabel = UILabel()
    var labelModelo : UILabel = UILabel()
    var labelAno : UILabel = UILabel()
    var labelPreco : UILabel = UILabel()
    var labelTaxa : UILabel = UILabel()
    
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("ghjhgjghjghjgh")
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        iniciaLayout()
    }
    
    
    func iniciaLayout() {
        
        
        label1.frame = CGRect(x: 8, y: 20, width: 100, height: 30)
        label1.clipsToBounds = true
        label1.text = "Tabela Fibe:"
        labelTabelaFibe.frame = CGRect(x: 8, y: 20, width: 100, height: 30)
        labelTabelaFibe.addConstraint(NSLayoutConstraint(item: labelTabelaFibe, attribute: .leading, relatedBy: .equal, toItem: label1, attribute: .trailing, multiplier: 1, constant: 15))
        labelTabelaFibe.clipsToBounds = true
        
        
        self.addSubview(label1)
        self.addSubview(labelTabelaFibe)
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

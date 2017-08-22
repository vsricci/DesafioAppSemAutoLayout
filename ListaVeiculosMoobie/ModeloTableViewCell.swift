//
//  ModeloTableViewCell.swift
//  ListaVeiculosMoobie
//
//  Created by Vinicius on 21/08/17.
//  Copyright © 2017 Vinicius. All rights reserved.
//

import UIKit

class ModeloTableViewCell: UITableViewCell {
    
    var fibeLabel : UILabel = UILabel()
    var modeloLabel : UILabel = UILabel()
    var anoLabel : UILabel = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("gbdfhfdghgf")
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        iniciaLayoutCell()
        
    }
    
    func iniciaLayoutCell() {
        
        fibeLabel.frame = CGRect(x: 8, y: 8, width: 300, height: 20)
        fibeLabel.clipsToBounds = true
        fibeLabel.font = UIFont.boldSystemFont(ofSize: 12)
        
        modeloLabel.frame = CGRect(x: 8, y: fibeLabel.frame.maxY, width: 300, height: 20)
        modeloLabel.clipsToBounds = true
        modeloLabel.font = UIFont.boldSystemFont(ofSize: 12)
        
        anoLabel.frame = CGRect(x: 8, y: modeloLabel.frame.maxY, width: 300, height: 20)
        anoLabel.clipsToBounds = true
        anoLabel.font = UIFont.boldSystemFont(ofSize: 12)
        
        self.addSubview(fibeLabel)
        self.addSubview(modeloLabel)
        self.addSubview(anoLabel)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

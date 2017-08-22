//
//  ListaMarcaVeiculosTableViewCell.swift
//  ListaVeiculosMoobie
//
//  Created by Vinicius on 21/08/17.
//  Copyright © 2017 Vinicius. All rights reserved.
//

import UIKit

class ListaMarcaVeiculosTableViewCell: UITableViewCell {
    
    var marcaLabel : UILabel = UILabel()
   

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        iniciaLayoutCell()
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func iniciaLayoutCell() {
        
        marcaLabel.frame = CGRect(x: 8, y: 8, width: 300, height: 30)
        marcaLabel.clipsToBounds = true
        
        self.addSubview(marcaLabel)
        
    }

}

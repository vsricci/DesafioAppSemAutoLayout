//
//  MarcaView.swift
//  ListaVeiculosMoobie
//
//  Created by Vinicius on 19/08/17.
//  Copyright © 2017 Vinicius. All rights reserved.
//

import UIKit

class MarcaView: UIView, UIScrollViewDelegate {
    
    var tituloLabel : UILabel = UILabel()
    var marcaLabel : UILabel = UILabel()
    var marcaTextfield : UITextField = UITextField()
    var modeloLabel : UILabel = UILabel()
    var modeloTextfield : UITextField = UITextField()
    var botaoSalvar : UIButton = UIButton()
    var scroll : UIScrollView = UIScrollView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implmented")
    }
    
    
    func iniciaLayout(){
        
        
        self.backgroundColor = UIColor.blue
        
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        scroll.delegate = self
        scroll.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
        tituloLabel.frame = CGRect(x: 8, y: 8, width: screenWidth - 16, height: 200)
        tituloLabel.clipsToBounds = true
        //tituloLabel.textAlignment = .center
        tituloLabel.text = "Nos Informe sua marca e modelo de carro preferidos para uma melhor pesquisa hehe :)"
        tituloLabel.font = UIFont.boldSystemFont(ofSize: 30)
        tituloLabel.numberOfLines = 0
        
        marcaLabel.frame = CGRect(x: 16, y: tituloLabel.frame.maxY + 20, width: screenWidth, height: 30)
        marcaLabel.clipsToBounds = true
       // marcaLabel.textAlignment = .center
        marcaLabel.text = "Marca:"
        
        marcaTextfield.frame = CGRect(x: 8, y: marcaLabel.frame.maxY, width: screenWidth - 16, height: 30)
        marcaTextfield.placeholder = "Informe a marca:"
        marcaTextfield.clipsToBounds = true
        marcaTextfield.borderStyle = UITextBorderStyle.roundedRect
        marcaTextfield.autocorrectionType = UITextAutocorrectionType.no
        marcaTextfield.keyboardType = UIKeyboardType.default
        marcaTextfield.returnKeyType = UIReturnKeyType.continue
        marcaTextfield.clearButtonMode = UITextFieldViewMode.whileEditing
        marcaTextfield.contentVerticalAlignment = UIControlContentVerticalAlignment.center

        
        modeloLabel.frame = CGRect(x: 16, y: marcaTextfield.frame.maxY + 10, width: screenWidth, height: 30)
        modeloLabel.clipsToBounds = true
        //modeloLabel.textAlignment = .center
        modeloLabel.text = "Modelo:"
        
        modeloTextfield.frame = CGRect(x: 8, y: modeloLabel.frame.maxY, width: screenWidth - 16, height: 30)
        modeloTextfield.placeholder = "Informe o modelo:"
        modeloTextfield.clipsToBounds = true
        modeloTextfield.borderStyle = UITextBorderStyle.roundedRect
        modeloTextfield.autocorrectionType = UITextAutocorrectionType.no
        modeloTextfield.keyboardType = UIKeyboardType.default
        modeloTextfield.returnKeyType = UIReturnKeyType.continue
        modeloTextfield.clearButtonMode = UITextFieldViewMode.whileEditing
        modeloTextfield.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        
        
        botaoSalvar.frame = CGRect(x: 8, y: modeloTextfield.frame.maxY + 50, width: screenWidth - 16, height: 30)
        botaoSalvar.clipsToBounds = true
        botaoSalvar.backgroundColor = UIColor.red
        botaoSalvar.layer.cornerRadius = 10
        botaoSalvar.setTitle("Salvar", for: .normal)
       
        
        scroll.addSubview(tituloLabel)
        scroll.addSubview(marcaLabel)
        scroll.addSubview(marcaTextfield)
        scroll.addSubview(modeloLabel)
        scroll.addSubview(modeloTextfield)
        scroll.addSubview(botaoSalvar)
        
        
        scroll.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 548)
        addSubview(scroll)
        
    }
    
    override func layoutSubviews() {
        iniciaLayout()
    }

}

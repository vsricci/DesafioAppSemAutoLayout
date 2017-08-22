//
//  LoginView.swift
//  ListaVeiculosMoobie
//
//  Created by Vinicius on 11/08/17.
//  Copyright © 2017 Vinicius. All rights reserved.
//

import UIKit

class LoginView: UIView, UIScrollViewDelegate {
    
    var scroll : UIScrollView = UIScrollView()
    var tituloLabel : UILabel = UILabel()
    var loginLabel : UILabel = UILabel()
    var loginTextfield : UITextField = UITextField()
    var senhaLabel : UILabel = UILabel()
    var senhaTextfield : UITextField = UITextField()
    var botaoLogar : UIButton = UIButton()
    
    

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("error")
    }
    
    
    override func layoutSubviews() {
     
        inicialicaView()
    }
    
    
    func inicialicaView() {
        
        
        self.backgroundColor = UIColor.yellow
        let screenWidth = UIScreen.main.bounds.width
        let screenHeigth = UIScreen.main.bounds.height
        
        scroll.delegate = self
        scroll.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
        tituloLabel.frame = CGRect(x: 0, y: 32, width: screenWidth, height: 60)
        tituloLabel.clipsToBounds = true
        tituloLabel.numberOfLines = 0
        tituloLabel.text = "Moobie"
        tituloLabel.font = UIFont.boldSystemFont(ofSize: 30)
        tituloLabel.textAlignment = .center
        
        
        loginLabel.frame = CGRect(x: 8, y: tituloLabel.frame.maxY, width: screenWidth, height: 30)
       // loginLabel.frame = CGRect.zero
        loginLabel.clipsToBounds = true
        loginLabel.numberOfLines = 0
        loginLabel.text = "Login"
        //loginLabel.font = UIFont.boldSystemFont(ofSize: 30)
       // loginLabel.textAlignment = .center

        
        
        loginTextfield.frame = CGRect(x: 8, y: loginLabel.frame.maxY, width: screenWidth - 16, height: 30)
        
        loginTextfield.placeholder = "login:"
        loginTextfield.clipsToBounds = true
        loginTextfield.borderStyle = UITextBorderStyle.roundedRect
        loginTextfield.autocorrectionType = UITextAutocorrectionType.no
        loginTextfield.keyboardType = UIKeyboardType.default
        loginTextfield.returnKeyType = UIReturnKeyType.continue
        loginTextfield.clearButtonMode = UITextFieldViewMode.whileEditing
        loginTextfield.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        
        
        senhaLabel.frame = CGRect(x: 8, y: loginTextfield.frame.maxY, width: screenWidth, height: 30)
        // loginLabel.frame = CGRect.zero
        senhaLabel.clipsToBounds = true
        senhaLabel.numberOfLines = 0
        senhaLabel.text = "Senha:"
        
        
        senhaTextfield.frame = CGRect(x: 8, y: senhaLabel.frame.maxY, width: screenWidth - 16, height: 30)
        
        senhaTextfield.placeholder = "senha:"
        senhaTextfield.clipsToBounds = true
        senhaTextfield.borderStyle = UITextBorderStyle.roundedRect
        senhaTextfield.autocorrectionType = UITextAutocorrectionType.no
        senhaTextfield.keyboardType = UIKeyboardType.default
        senhaTextfield.returnKeyType = UIReturnKeyType.continue
        senhaTextfield.clearButtonMode = UITextFieldViewMode.whileEditing
        senhaTextfield.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        
        
        botaoLogar.frame = CGRect(x: 8, y: senhaTextfield.frame.maxY + 50, width: screenWidth - 16, height: 30)
        botaoLogar.clipsToBounds = true
        botaoLogar.backgroundColor = UIColor.red
        botaoLogar.layer.cornerRadius = 10
        botaoLogar.setTitle("Cadastrar", for: .normal)
        botaoLogar.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)

        
        scroll.addSubview(tituloLabel)
        scroll.addSubview(loginLabel)
        scroll.addSubview(loginTextfield)
        scroll.addSubview(senhaLabel)
        scroll.addSubview(senhaTextfield)
        scroll.addSubview(botaoLogar)
        
        scroll.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 548)
        addSubview(scroll)
    }

}

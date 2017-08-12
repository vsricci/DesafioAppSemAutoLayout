//
//  CadastroView.swift
//  ListaVeiculosMoobie
//
//  Created by Vinicius on 11/08/17.
//  Copyright © 2017 Vinicius. All rights reserved.
//

import UIKit

class CadastroView: UIView {
    
    var labelNome : UILabel = UILabel()
    var labelImagem : UILabel = UILabel()
    var labelSobreNome : UILabel = UILabel()
    var labelMarcaPreferida : UILabel = UILabel()
    var nomeUsuario : UITextField = UITextField()
    var imagemUsuario : UIImageView = UIImageView()
    var sobreNomeUsuario : UITextField = UITextField()
    var marcaPreferida : UITextField = UITextField()
    var labelSenha : UILabel = UILabel()
    var labelEmail : UILabel = UILabel()
    var botaoSalvar : UIButton = UIButton()
    var botaoFacebook : UIButton = UIButton()
    var scroll : UIScrollView = UIScrollView()
    var pickerSexo : UIPickerView = UIPickerView()
    var pickerIdade : UIDatePicker = UIDatePicker()
    var textFieldIdade : UITextField = UITextField()
    var textFieldSexo: UITextField = UITextField()
    var labelIdade : UILabel = UILabel()
    var labelSexo : UILabel = UILabel()
    var labelTelefone : UILabel = UILabel()
    var telefoneUsuario : UITextField = UITextField()
    var emailUsuario : UITextField = UITextField()
    var botaoGaleria : UIButton = UIButton()
    var botaoCamera : UIButton = UIButton()
    
    var usuario = Usuario()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implmented")
    }
    
    
    override func layoutSubviews() {
        
        
        layoutCadastro()
        
    }
    
    
    func layoutCadastro() {
        
        
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        
        
        
        imagemUsuario.frame = CGRect(x: 8, y: 8, width: screenWidth, height: screenHeight)
        imagemUsuario.image = UIImage(named: "")
        botaoCamera.frame = CGRect(x: imagemUsuario.frame.minX, y: imagemUsuario.frame.maxY, width: 30, height: 30)
        
        
        botaoGaleria.frame = CGRect(x: imagemUsuario.frame.minX, y: imagemUsuario.frame.maxY, width: 30, height: 30)
        
        labelNome.frame = CGRect(x: imagemUsuario.frame.maxX, y: imagemUsuario.frame.maxY, width: screenWidth, height: screenHeight)
        
        nomeUsuario.frame =  CGRect(x: labelNome.frame.minX, y: labelNome.frame.minY, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
        labelSobreNome.frame = CGRect(x: nomeUsuario.frame.minX, y: nomeUsuario.frame.minY, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
        sobreNomeUsuario.frame = CGRect(x: labelSobreNome.frame.minX, y: labelSobreNome.frame.minY, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
        labelEmail.frame = CGRect(x: sobreNomeUsuario.frame.minX, y: sobreNomeUsuario.frame.minY, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
        emailUsuario.frame = CGRect(x: labelEmail.frame.minX, y: emailUsuario.frame.minY, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
        labelTelefone.frame =  CGRect(x: emailUsuario.frame.minX, y: emailUsuario.frame.minY, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
        telefoneUsuario.frame = CGRect(x: labelTelefone.frame.minX, y: labelTelefone.frame.minY, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
        labelIdade.frame =  CGRect(x: telefoneUsuario.frame.minX, y: telefoneUsuario.frame.minY, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
        textFieldIdade.frame = CGRect(x: labelIdade.frame.minX, y: labelIdade.frame.minY, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
        
        labelSexo.frame = CGRect(x: textFieldIdade.frame.minX, y: textFieldIdade.frame.minY, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
        textFieldSexo.frame = CGRect(x: labelSexo.frame.minX, y: labelSexo.frame.minY, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
        
        botaoFacebook.frame = CGRect(x: textFieldSexo.frame.maxX, y: textFieldSexo.frame.maxY, width: screenWidth, height: screenHeight)
        
        botaoSalvar.frame = CGRect(x: botaoFacebook.frame.minX, y: botaoFacebook.frame.maxY, width: screenWidth, height: screenHeight)
        
        
        labelNome.text = "Dogite o nome: "
        labelNome.tintColor = UIColor.black
        
        labelSobreNome.text = "Dogite o SobreNome: "
        labelSobreNome.tintColor = UIColor.black
        
        labelEmail.text = "Dogite o email: "
        labelEmail.tintColor = UIColor.black
        
        
        nomeUsuario.placeholder = "Nome:"
        sobreNomeUsuario.placeholder = "SobreNome"
        emailUsuario.placeholder = "Email:"
        telefoneUsuario.placeholder = "Telefone:"
        textFieldIdade.placeholder = "Idade:"
        botaoFacebook.setTitle("Login com os dados do Facebook", for: .normal)
        botaoSalvar.setTitle("Cadastrar", for: .normal)
        
        
        
        
        addSubview(imagemUsuario)
        addSubview(botaoCamera)
        addSubview(botaoGaleria)
        addSubview(labelNome)
        addSubview(nomeUsuario)
        addSubview(labelSobreNome)
        addSubview(sobreNomeUsuario)
        addSubview(labelEmail)
        addSubview(labelEmail)
        addSubview(labelTelefone)
        addSubview(telefoneUsuario)
        addSubview(labelIdade)
        addSubview(textFieldIdade)
        addSubview(labelSexo)
        addSubview(textFieldSexo)
        addSubview(botaoFacebook)
        addSubview(botaoSalvar)
        
        
        
        
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

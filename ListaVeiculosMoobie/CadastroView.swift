//
//  CadastroView.swift
//  ListaVeiculosMoobie
//
//  Created by Vinicius on 11/08/17.
//  Copyright © 2017 Vinicius. All rights reserved.
//

import UIKit




class CadastroView: UIView, UITextFieldDelegate, UIScrollViewDelegate {
    
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
    var senhaUsuario : UITextField = UITextField()
    
    var usuario = Usuario()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        //layoutCadastro()
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
        
        
        self.backgroundColor = UIColor.green
        
        scroll.delegate = self
        scroll.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
        
        imagemUsuario.frame = CGRect(x: 8, y: 8, width: screenWidth / 2, height: 60)
        imagemUsuario.image = UIImage(named: "")
        botaoCamera.frame = CGRect(x: 16, y: imagemUsuario.frame.maxY, width: 30, height: 30)
        imagemUsuario.clipsToBounds = true
        botaoCamera.setTitle("Tirar Foto", for: .normal)
        
        
        botaoGaleria.frame = CGRect(x: botaoCamera.frame.minX, y: imagemUsuario.frame.maxY, width: 30, height: 30)
        botaoGaleria.clipsToBounds = true
        botaoCamera.setTitle("Selecionar da Galeria", for: .normal)
        
        labelNome.frame = CGRect(x: 8, y: botaoGaleria.frame.maxY, width: screenWidth, height: 30)
        labelNome.clipsToBounds = true
        labelNome.text = "Digite o Nome:"
        
        nomeUsuario.frame =  CGRect(x: 8, y: labelNome.frame.maxY, width: UIScreen.main.bounds.width, height: 30)
        nomeUsuario.clipsToBounds = true
        nomeUsuario.placeholder = "Nome:"
        
        
        labelSobreNome.frame = CGRect(x: 8, y: nomeUsuario.frame.maxY, width: UIScreen.main.bounds.width, height: 30)
        labelSobreNome.clipsToBounds = true
        labelSobreNome.text = "Digite o Sobrenome:"
        
        sobreNomeUsuario.frame = CGRect(x: 8, y: labelSobreNome.frame.maxY, width: UIScreen.main.bounds.width, height: 30)
        sobreNomeUsuario.clipsToBounds = true
        sobreNomeUsuario.placeholder = "SobreNome:"
        
        labelEmail.frame = CGRect(x: 8, y: sobreNomeUsuario.frame.maxY, width: UIScreen.main.bounds.width, height: 30)
        labelEmail.clipsToBounds = true
        labelEmail.text = "Digite o Email:"
        
        emailUsuario.frame = CGRect(x: 8, y: labelEmail.frame.maxY, width: UIScreen.main.bounds.width, height: 30)
        emailUsuario.clipsToBounds = true
        emailUsuario.placeholder = "Email:"
        
        labelTelefone.frame =  CGRect(x: 8, y: emailUsuario.frame.maxY, width: UIScreen.main.bounds.width, height: 30)
        labelTelefone.clipsToBounds = true
        labelTelefone.text = "Diguite o Telefone:"
        
        telefoneUsuario.frame = CGRect(x: 8, y: labelTelefone.frame.maxY, width: UIScreen.main.bounds.width, height: 30)
        telefoneUsuario.clipsToBounds = true
        telefoneUsuario.placeholder = "Telefone:"
        
        labelIdade.frame =  CGRect(x: 8, y: telefoneUsuario.frame.maxY, width: UIScreen.main.bounds.width, height: 30)
        labelIdade.clipsToBounds = true
        labelIdade.text = "Digite a Idade:"
        
        textFieldIdade.frame = CGRect(x: 8, y: labelIdade.frame.maxY, width: UIScreen.main.bounds.width, height: 30)
        textFieldIdade.clipsToBounds = true
        textFieldIdade.placeholder = "Idade:"
        
        labelSexo.frame = CGRect(x: 8, y: textFieldIdade.frame.maxY, width: UIScreen.main.bounds.width, height: 30)
        labelSexo.clipsToBounds = true
        labelSexo.text = "Digite o sexo:"
        
        
        
        textFieldSexo.frame = CGRect(x: 8, y: labelSexo.frame.maxY, width: UIScreen.main.bounds.width, height: 30)
        textFieldSexo.clipsToBounds = true
        textFieldSexo.placeholder = "Sexo:"
        
        
        
        
        
        labelSenha.frame = CGRect(x: 8, y: textFieldSexo.frame.maxY, width: UIScreen.main.bounds.width, height: 30)
        labelSenha.clipsToBounds = true
        labelSenha.text = "Digite a Senha:"
        
        
        
        senhaUsuario.frame = CGRect(x: 8, y: labelSenha.frame.maxY, width: UIScreen.main.bounds.width, height: 30)
        senhaUsuario.clipsToBounds = true
        senhaUsuario.placeholder = "Senha:"

        
        
        botaoFacebook.frame = CGRect(x: 0, y: senhaUsuario.frame.maxY, width: screenWidth, height: 30)
        botaoFacebook.clipsToBounds = true
        botaoFacebook.setTitle("Logar com Facebook", for: .normal)
        
        botaoSalvar.frame = CGRect(x: botaoFacebook.frame.minX, y: botaoFacebook.frame.maxY, width: screenWidth, height: 30)
        botaoSalvar.clipsToBounds = true
        botaoSalvar.setTitle("CADASTRAR", for: .normal)
        
        
        scroll.addSubview(imagemUsuario)
        scroll.addSubview(botaoCamera)
        scroll.addSubview(botaoGaleria)
        scroll.addSubview(labelNome)
        scroll.addSubview(nomeUsuario)
        scroll.addSubview(labelSobreNome)
        scroll.addSubview(sobreNomeUsuario)
        scroll.addSubview(labelEmail)
        scroll.addSubview(labelEmail)
        scroll.addSubview(emailUsuario)
        scroll.addSubview(labelTelefone)
        scroll.addSubview(telefoneUsuario)
        scroll.addSubview(labelIdade)
        scroll.addSubview(textFieldIdade)
        scroll.addSubview(labelSexo)
        scroll.addSubview(textFieldSexo)
        scroll.addSubview(labelSenha)
        scroll.addSubview(senhaUsuario)
        scroll.addSubview(botaoFacebook)
        scroll.addSubview(botaoSalvar)
        
        scroll.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 700)
        addSubview(scroll)
        
    }
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

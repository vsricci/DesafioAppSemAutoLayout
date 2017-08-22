//
//  CadastroViewController.swift
//  ListaVeiculosMoobie
//
//  Created by Vinicius on 11/08/17.
//  Copyright © 2017 Vinicius. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseStorage
import MediaPlayer
import MobileCoreServices

class CadastroViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource,  UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
     var cadastroView = CadastroView()
    var usuario = Usuario()
    var sexo : [String] = ["Masculino", "Feminino"]
    let notificatonCenter = NotificationCenter.default
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return sexo.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        
        
        return  sexo[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
        cadastroView.textFieldSexo.text = sexo[row]
    }
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        iniciaView()
        inicializaElementosCadastro()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func inicializaElementosCadastro(){
        
        usuario.nome = "Vinicius Ricci"
        
        cadastroView.nomeUsuario.text = usuario.nome
        cadastroView.pickerSexo.dataSource = self
        cadastroView.pickerSexo.delegate = self
        cadastroView.textFieldSexo.inputView = cadastroView.pickerSexo
        
        cadastroView.botaoGaleria.addTarget(self, action: #selector(selecionarGaleria), for: .touchUpInside)
        cadastroView.botaoCamera.addTarget(self, action: #selector(tirarFoto), for: .touchUpInside)
        
        cadastroView.botaoSalvar.addTarget(self, action: #selector(cadastrar), for: .touchUpInside)
    }
    
    func iniciaView() {
        
        
        cadastroView = CadastroView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        
        self.view.addSubview(cadastroView)
        
        
        
        
    }
    
    func cadastrar(){
        
        
        if  self.cadastroView.nomeUsuario.text! == "" && self.cadastroView.sobreNomeUsuario.text! == "" && self.cadastroView.emailUsuario.text! == "" && self.cadastroView.telefoneUsuario.text! == "" && self.cadastroView.textFieldIdade.text! == "" && self.cadastroView.textFieldSexo.text! == "" {
            
            var alert : UIAlertView = UIAlertView()
            alert.title = "Dados incompletos"
            alert.message = "Por favor, preeencha todos os dados!!!"
            alert.addButton(withTitle: "OK")
            alert.show()
        }
        else{
            
            
            
            
            
           guard let nome = cadastroView.nomeUsuario.text, let sobrenome = self.cadastroView.sobreNomeUsuario.text, let email = self.cadastroView.emailUsuario.text, let telefone = self.cadastroView.telefoneUsuario.text, let idade = self.cadastroView.textFieldIdade.text, let sexo = self.cadastroView.textFieldSexo.text, let senha = self.cadastroView.senhaUsuario.text
                
                
                else{
                    print("Form is not valid")
                    return
            }
        
        
            //autenticando user no firebase
            
            Auth.auth().createUser(withEmail: email, password: senha, completion: { (user, error) in
                
                if error != nil{
                    
                    var alert = UIAlertView()
                    alert.title = "Erro ao cadastrar!!!"
                    alert.message = "IHHHH voce ja se cadastrou, este  email ja esta em nosso banco, voce talvez tenha se cadastrado pelo facebook ou google e esta usando o mesmo email, tente logar por uma dessas contas ou utilize ou email hehe :)"
                    alert.addButton(withTitle: "OK")
                    alert.show()
                    print(error)
                    return
                }
                
                
                
                guard let uid = user?.uid else {
                    return
                }
                
                let imageName = NSUUID().uuidString
                
                let storageRef = Storage.storage().reference().child("imagem_usuario").child("\(imageName).png")
                
                if let uploadData = UIImagePNGRepresentation((self.cadastroView.imagemUsuario.image)!){
                    
                    let newData = UIImageJPEGRepresentation(UIImage(data: uploadData)!, 1)
                    
                    
                    storageRef.putData(newData!, metadata: nil, completion: { (metadata, error) in
                        if error != nil{
                            print(error)
                            return
                        }
                        
                        if let imagemPerfil = metadata?.downloadURL()?.absoluteString{
                            
                            
                            
                            
                            let values = ["nome": nome, "sobrenome": sobrenome, "email": email, "telefone": telefone, "idade": idade, "sexo": sexo, "imagemPerfil": imagemPerfil, "senha": senha]
                            
                            
                            
                            self.enviandoDadosUsuario(uid: uid, values: values as [String : AnyObject])
                            
                            
                        }
                        
                    })
                    
                }
                
            })
            
            
            
        }
            
      
    }
    
    func enviandoDadosUsuario(uid: String, values: [String : AnyObject]){
        
        let ref =  Database.database().reference(fromURL: "https://ricci-boutique-xamarin.firebaseio.com/")
        
        let userReference = ref.child("usuarios").child(uid)
        
        // values = ["nome": name, "sobrenome": email, "profileImageUrl": metadata.downloadUrl()]
        userReference.updateChildValues(values, withCompletionBlock: { (err, ref) in
            
            if err != nil{
                print(err)
                return
            }
            
            self.dismiss(animated: true, completion: nil)
            
            
            
            // print("Save user successfully into Firebase db")
        })
        

    }
    
    func getMediaUIImagePickerControllerSourceType(sourceType: UIImagePickerControllerSourceType) -> Void{
        
        let myMediaPicker: NSArray = UIImagePickerController.availableMediaTypes(for: sourceType)! as NSArray
        
        
        // caso seja diferente de zero significa que existe algum tipo de elemento mediapicker
        if myMediaPicker.count != 0 && UIImagePickerController.isSourceTypeAvailable(sourceType)
        {
            
            // passa o controle da aplicacao para esse tipo de elemento, sendo camera ou biblioteca
            let myPickerController : UIImagePickerController = UIImagePickerController()
            myPickerController.sourceType = sourceType
            
            // permitir que o usuario edite o arquivo que ele selecionar da biblioteca ou a foto que foi tirada
            myPickerController.allowsEditing = true
            myPickerController.mediaTypes = myMediaPicker as! [String]
            
            // aqui faz o retorno pra nossa propria classe que tera os metodos que irao trabalhar no arquivo retornado
            myPickerController.delegate = self
            // apresenta a nova tela
            self.present(myPickerController, animated: true, completion: nil)
        }
        else{
            
            let  myAlert : UIAlertView = UIAlertView()
            myAlert.title = " Não possui camera"
            myAlert.message = " Esta funcionalidade não pode ser ativada, pois seu dispositivo não possui camera"
            myAlert.addButton(withTitle: "OK")
            myAlert.show()
        }
        
        
    }
    
    func habilitarButtonCamera()
    {
        
        // verifica se o dispositivo possui camera
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) == false
        {
            //propriedade hidden para setar como visivel ou invisivel, se for true esta invisivel
            // myButton.hidden = true
            let  myAlert : UIAlertView = UIAlertView()
            myAlert.title = " Não possui camera"
            myAlert.message = " Esta funcionalidade não pode ser ativada, pois seu dispositivo não possui camera"
            myAlert.addButton(withTitle: "OK")
            myAlert.show()
            
        }
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        var selectedImageFromPicker: UIImage?
        
        if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage{
            
            selectedImageFromPicker = editedImage
            
        }
            
        else if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage{
            
            // print((originalImage as AnyObject).size)
            
            selectedImageFromPicker = originalImage
        }
        
        if let selectedImage = selectedImageFromPicker{
            
            cadastroView.imagemUsuario.image = selectedImageFromPicker
        }
        
        
        
        dismiss(animated: true, completion: nil)
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        cadastroView.imagemUsuario.image = UIImage(named: "img_perfil_app_ios")
        
        picker.dismiss(animated: true, completion: nil)
    }

    func tirarFoto() {
        
        self.getMediaUIImagePickerControllerSourceType(sourceType: UIImagePickerControllerSourceType.camera)
    }
    
    
    func selecionarGaleria() {
        
        self.getMediaUIImagePickerControllerSourceType(sourceType: UIImagePickerControllerSourceType.photoLibrary)
    }
    



}

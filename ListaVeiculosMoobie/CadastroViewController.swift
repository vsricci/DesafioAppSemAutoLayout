//
//  CadastroViewController.swift
//  ListaVeiculosMoobie
//
//  Created by Vinicius on 11/08/17.
//  Copyright © 2017 Vinicius. All rights reserved.
//

import UIKit
import Firebase


class CadastroViewController: UIViewController {
    
     var cadastroView = CadastroView()
    var usuario = Usuario()
    

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
    }
    
    func iniciaView() {
        
        
        cadastroView = CadastroView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        
        self.view.addSubview(cadastroView)
        
        
        
        
    }
    
   /* func cadastrar(uid: String, values: [String : AnyObject]){
            
            let ref = Fir.database().reference(fromURL: "https://ricci-boutique-xamarin.firebaseio.com/")
            
            let userReference = ref.child("usuarios").child(uid)
            
            // let values = ["name": name, "email": email, "profileImageUrl": metadata.downloadUrl()]
            userReference.updateChildValues(values, withCompletionBlock: { (err, ref) in
                
                if err != nil{
                    print(err)
                    return
                }
                
                self.dismiss(animated: true, completion: nil)
                
                
                
                // print("Save user successfully into Firebase db")
            })
            
        
    }*/
    



}

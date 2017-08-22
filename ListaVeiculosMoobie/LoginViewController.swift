//
//  LoginViewController.swift
//  ListaVeiculosMoobie
//
//  Created by Vinicius on 19/08/17.
//  Copyright © 2017 Vinicius. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    var loginView = LoginView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        inicializaComponentesLoginView()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func inicializaComponentesLoginView() {
        
        loginView = LoginView(frame : CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        
        self.view.addSubview(loginView)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

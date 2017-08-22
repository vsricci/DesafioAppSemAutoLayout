//
//  DetalhesModeloViewController.swift
//  ListaVeiculosMoobie
//
//  Created by Vinicius on 22/08/17.
//  Copyright © 2017 Vinicius. All rights reserved.
//

import UIKit

class DetalhesModeloViewController: UIViewController {
    
    var detalheModeloView = DetalheModeloView()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        iniciaComponentes()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func iniciaComponentes(){
        
        detalheModeloView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        
        
        self.view.addSubview(detalheModeloView)
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

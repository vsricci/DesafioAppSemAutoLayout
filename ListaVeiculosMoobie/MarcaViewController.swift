//
//  MarcaViewController.swift
//  ListaVeiculosMoobie
//
//  Created by Vinicius on 19/08/17.
//  Copyright © 2017 Vinicius. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage
import FirebaseAuth
import Alamofire
import SwiftyJSON
class MarcaViewController: UIViewController {
    
    var marcaView = MarcaView()
    var loginSuccess = Bool()
    var statusCode = String()
    
    var marcas = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        iniciaView()
        buscarMarcasVeiculos()
        testeAlamofire()
        
       // teste2()

        
        teste3()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func iniciaView() {
        
        
        marcaView = MarcaView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        
        self.view.addSubview(marcaView)
        
        inicializaFuncionalidadeComponentesMarcaView()
        
        
    }
    
    func inicializaFuncionalidadeComponentesMarcaView() -> Void {
        
         marcaView.botaoSalvar.addTarget(self, action: #selector(buscarMarcasVeiculos
            ), for: .touchUpInside)
        
    }
    
    
    func salvaMarca(){
        
        if self.marcaView.marcaTextfield.text == "" && self.marcaView.modeloTextfield.text == "" {
            
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (
                UIAlertAction) in
                
                self.marcaView.marcaTextfield.text = ""
                self.marcaView.marcaTextfield.becomeFirstResponder()
            })
            
            let alertaVC = UIAlertController(title: "Dados imcompletos", message: "Para prosseguir informe todos os dados", preferredStyle: .actionSheet)
            
            alertaVC.addAction(ok)
            self.present(alertaVC, animated: true, completion: nil)
            
        }
        
        else {
            
             guard let marca = self.marcaView.marcaTextfield.text, let modelo = self.marcaView.modeloTextfield.text else { return }
            
            
            
        }
    }
    
    
    func buscarMarcasVeiculos() {
        print("tetseetsetsetestestetse")
        
        let stringURL = "https://fipe-api.herokuapp.com/cars/brand"
        
           // if let jsonData = try? JSONSerialization.data(withJSONObject:  [], options: .prettyPrinted){
            
            let headers: HTTPHeaders = [
                "Content-Type": "application/json; charset=UTF-8; ",
                // "Content-Type": "charset=UTF-8",
                "Accept": "application/json; charset=UTF-8;",
                //"Accept": "charset=UTF-8",
                "Transfer-Encoding": "chunked",
                 "x-powered-by": "Express",
                "Connection": "Keep-Alive",
                "via": "1.1 vegur",
                "server": "Cowboy"
            ]
            
            
        
            let url = URL(string: stringURL)!
            
          //  let config = URLSessionConfiguration.default
          //  config.httpAdditionalHeaders = headers
          //  let session = URLSession(configuration: config)
            
            
            
            
           /* var request = URLRequest(url : url)
            //var request = NSMutableURLRequest(url:url)
            request.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
            request.httpMethod = "GET"*/
            
            
            //request.httpBody = jsonData
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        let session = URLSession.shared
        //create dataTask using the session object to send data to the server
        let task = session.dataTask(with: request , completionHandler: { data, response, error in
            guard error == nil else {
                
                print("deu erro no error")
                return print("deu erro no error")
            }
            guard let data = data else {
                
                print("deu erro no data")
                return
            }
            
            
            
            do {
                //criar o json data
                
                
                if  let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: AnyObject]  {
                    // handle json...
                    print("tretsetet" + "\(json)")
                    
                    
                    
                    if let valor = json["marca"]  {
                        
                        let marca = valor as! String
                        print(marca)
                    }
                    
                    
            }
            
            } catch let error {
                print(error.localizedDescription)
                
              //  self.startAnimating()
                
 
            }
            
            
        })
        task.resume()
                
      //  }
    }

    
    func tetetete(teste: [String]) {
        
        print(teste.count)
    }
    
    func teste3() {
        
        guard let url = URL(string: "https://fipe-api.herokuapp.com/cars/brand") else {
            print("Url conversion issue.")
            return
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        
        var teamJSON: [String: AnyObject]?
        
        URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
            // Check if data was received successfully
            if error == nil && data != nil {
                 do {
                
                     var teste = JSON(data: data!)
                    
                  //  let teamJSON = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as? [String : AnyObject]
                    
                    
                    print(teste)
                    
                    for item in teste.arrayValue {
                        print(item["marca"].stringValue)
                        
                        let marca = item["marca"].stringValue
                        
                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now(), execute: {
                            
                            self.marcas.append(marca)
                           // self.tetetete(teste: self.marcas)
                        })
                        
                    }
                    
                    
                    
                 //let JSONString = String(data: data!, encoding: String.Encoding.utf8)
                   // print(JSONString!)
                    
                    
                    }catch let error as NSError {
                    print(error)
                }
                
                
                
                
                }
          
           
        }).resume()
    }
    
    
    func teste2() {
        
        guard let url = URL(string: "https://fipe-api.herokuapp.com/cars/brand") else {
            print("Url conversion issue.")
            return
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        
        var teamJSON: NSDictionary?
        
        URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
            // Check if data was received successfully
            if error == nil && data != nil {
                do {
            
                    teamJSON = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
                    
                    
                    print("testando " + "\(teamJSON)")
                    
                            if let marca = teamJSON {
                                
                                let teste = marca["marca"] as! String
                                print("A marca é " + teste)
                            }
                            
                    
                    let liquidLocations: NSArray = teamJSON!["marca"] as! NSArray
                    
                    for valores  in 0 ..< liquidLocations.count{
                        
                        let marca = teamJSON?[valores] as! String
                        print("marcas de carros " + marca)
                        
                    }
                    
                    } catch {
                  //  completionHandler(false)
                }
            }
            else if error != nil
            {
               // completionHandler(false)
            }
        }).resume()
    }
    
    func testeAlamofire() {
        
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json; charset=UTF-8; ",
            // "Content-Type": "charset=UTF-8",
            "Accept": "application/json; charset=UTF-8;",
            //"Accept": "charset=UTF-8",
            "Transfer-Encoding": "chunked",
            "x-powered-by": "Express",
            "Connection": "Keep-Alive",
            "via": "1.1 vegur",
            "server": "Cowboy"
        ]

        
        Alamofire.request(URL(string: "http://fipe-api.herokuapp.com/cars/brand")!, method: .get, encoding: JSONEncoding.default, headers: headers).validate()
        
        
            
            .responseJSON { response in
                guard response.result.error == nil else {
                    // got an error in getting the data, need to handle it
                    print("error calling POST ")
                    print(response.result.error!)
                    return
                    
                }
                guard let json = response.result.value as? [String: AnyObject] else {return}
                print(json)
                if let status = json["marca"] {
                    print(status)
                    self.statusCode = String(describing: status)
                }
        }
    }
  
    
    
}

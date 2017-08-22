//
//  DetalhesMarcaVeiculoViewController.swift
//  ListaVeiculosMoobie
//
//  Created by Vinicius on 21/08/17.
//  Copyright © 2017 Vinicius. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import NVActivityIndicatorView

class DetalhesMarcaVeiculoViewController: UIViewController, NVActivityIndicatorViewable, UITableViewDelegate, UITableViewDataSource {
    
    var marca : String!
    var modeloList = [Modelo]()
    var identifierCell = "cell"
    var modeloView = ModeloView()
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modeloList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifierCell) as! ModeloTableViewCell
        
        
        let item = modeloList[indexPath.row]
        
        cell.fibeLabel.text = item.codigoFipe
        cell.modeloLabel.text = item.modelo
        cell.anoLabel.text = item.ano
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let item = modeloList[indexPath.row]
        
        mostrarDetalhesModelo(ano: item.ano, modelo: item.modelo)
        
    }
    
    func mostrarDetalhesModelo(ano : String, modelo : String) {
    
    
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        
        iniciaComponentes()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func buscarDetalhesMarcaVeiculos(){
        
        guard let url = URL(string: "https://fipe-api.herokuapp.com/cars/brand/" + marca) else {
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
                        
                        let modelos = Modelo()
                        let fibe = item["codigo_fipe"].stringValue
                        let modelo = item["modelo"].stringValue
                        let ano = item["ano"].stringValue
                        
                        
                        modelos.codigoFipe = fibe
                        modelos.modelo = modelo
                        modelos.ano = ano
                        
                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now(), execute: {
                            
                            self.modeloList.append(modelos)
                            self.modeloView.tableView.reloadData()
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
    
    func iniciaComponentes() {
        
        
        modeloView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
        self.view.addSubview(modeloView)
        
        
        modeloView.tableView.register(ModeloTableViewCell.self, forCellReuseIdentifier: identifierCell)
        
        modeloView.tableView.dataSource = self
        modeloView.tableView.delegate = self
        
        
        buscarDetalhesMarcaVeiculos()
        
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

//
//  ListaModeloVeiculosViewControlletViewController.swift
//  ListaVeiculosMoobie
//
//  Created by Vinicius on 21/08/17.
//  Copyright © 2017 Vinicius. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ListaModeloVeiculosViewControlletViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    var listaVeiculoMarcaView = ListaVeiculosMarcaView()
    var marcaVeiculosList = [Marca]()
    var identifierCell = "cell"
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return marcaVeiculosList.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifierCell, for: indexPath) as! ListaMarcaVeiculosTableViewCell
        
        
        let item = marcaVeiculosList[indexPath.row]
        
        
        cell.marcaLabel.text = item.marca
        cell.marcaLabel.numberOfLines = 0
        cell.marcaLabel.font = UIFont.boldSystemFont(ofSize: 17)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let item = marcaVeiculosList[indexPath.row]
        
        mostraDetalhes(marca: item.marca)
        
        
    }
    
  
    
    
    func mostraDetalhes(marca: String) {
        
        let detalhesVC =  DetalhesMarcaVeiculoViewController()
        
        detalhesVC.marca = marca
        
        self.navigationController?.pushViewController(detalhesVC, animated: true)
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Detalhes Msrcas"
        iniciaComponentes()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func iniciaComponentes(){
        
        
        listaVeiculoMarcaView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
        self.view.addSubview(listaVeiculoMarcaView)
        
        
        listaVeiculoMarcaView.tableView.register(ListaMarcaVeiculosTableViewCell.self, forCellReuseIdentifier: identifierCell)

        listaVeiculoMarcaView.tableView.dataSource = self
        listaVeiculoMarcaView.tableView.delegate = self
        
        buscaListaMarcaVeiculos()
    }
    
    func buscaListaMarcaVeiculos() {
        
        
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
                        
                        let marcas = Marca()
                        let marca = item["marca"].stringValue
                        marcas.marca = marca
                        
                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now(), execute: {
                            
                            self.marcaVeiculosList.append(marcas)
                            self.listaVeiculoMarcaView.tableView.reloadData()
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

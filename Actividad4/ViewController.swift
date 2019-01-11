//
//  ViewController.swift
//  Actividad4
//
//  Created by usuario on 1/9/19.
//  Copyright © 2019 usuario. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var txtpass: UITextField!
    @IBAction func btnLogin(_ sender: Any) {
        print("Okas")
        
        let request = URLRequest(url: URL(string: "\(Constantes.URL_DESA.apiWSLogin)?username=\(txtUser.text!)&password=\(txtpass.text!.toBase6())")!)
        //username: salvatore.isc@gmail.com
        //password: salvapunk
        let task = URLSession.shared.dataTask(with: request) { (data, resp, error ) in
            if error != nil {
                print("se produjo un error \(error)")
            }else{
                if let info = data{
                    do{
                        let jsonResult = try JSONSerialization.jsonObject(with: info) as! [String:AnyObject]
                        print(jsonResult)
                        if let status = jsonResult["status"]{
                            if status as! Int == 1 {
                                print("WELCOME")
                                DispatchQueue.main.async {
                                    let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
                                    let controller = storyboard.instantiateViewController(withIdentifier: "VC2")
                                    self.present(controller, animated: true, completion: nil)
                                }
                            }
                        }
                    }catch{
                        
                    }
                }
            }
        }
        task.resume()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}


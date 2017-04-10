//
//  ViewController.swift
//  Authorization
//
//  Created by admin on 06.02.17.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var tableItems: [Table] = []
   
    
    @IBOutlet var fieldAuthorizationLogin: UITextField!
    
    @IBOutlet var fieldAuthorizationPass: UITextField!
   
    
    @IBAction func logOnButton(_ sender: UIButton) {
        authoRization()
    }
    @IBAction func buttonRegister(_ sender: UIButton) {
        
        
        
    }
    
    @IBOutlet var labelAuthorizationResult: UILabel!
    
    
    func authoRization()
     {
    
        var passTmp: String = ""
        var autBool: Bool = false
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
  //      let entity = NSEntityDescription.entity(forEntityName: "Table", in: context)
   //     let tableObject = NSManagedObject(entity: entity!, insertInto: context) as! Table

        let fetchRequest: NSFetchRequest<Table> = Table.fetchRequest()
      //  fetchRequest.predicate = NSPredicate(format: "login == %@", (fieldAuthorizationLogin.text)!)
        fetchRequest.returnsObjectsAsFaults = false
     
            
        do {
            tableItems = try context.fetch(fetchRequest)
            
        } catch {
            print(error.localizedDescription)
        }
        
        
        for j in tableItems {
            if fieldAuthorizationLogin.text == j.login! {
               passTmp = (j.pass)!
                autBool = true
            }
        }
       
        
        if autBool {
        if fieldAuthorizationPass.text == passTmp  {
            labelAuthorizationResult.text! = "Authorization successful!"
        } else {labelAuthorizationResult.text! = "Authorization is not successful!"}
        } else {labelAuthorizationResult.text! = "Account is not found."}
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
}


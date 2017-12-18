//
//  Authorization.swift
//  Authorization
//
//  Created by admin on 17.12.2017.
//  Copyright © 2017 admin. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class Authorization: UIViewController {
    
    @IBOutlet weak var fieldAuthorizationLogin: UITextField!
    
    @IBOutlet weak var fieldAuthorizationPass: UITextField!
    
    @IBAction func logOnButton(_ sender: Any) {
        authoRization()
    }
    @IBAction func regButton(_ sender: Any) {
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let DelAllReqVar = NSBatchDeleteRequest(fetchRequest: NSFetchRequest<NSFetchRequestResult>(entityName: "Table"))
        do {
            try managedContext.execute(DelAllReqVar)
        }
        catch {
            print(error)
        }
    }
    @IBOutlet weak var labelAuthorizationResult: UILabel!
    
    var tableItems: [Table] = []

    func authoRization()
    {
        var passTmp: String = ""
        var autBool: Bool = false
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Table> = Table.fetchRequest()
        fetchRequest.returnsObjectsAsFaults = false
        
        do {
            tableItems = try context.fetch(fetchRequest)
            
        } catch {
            print(error.localizedDescription)
        }
        
        // print(tableItems)
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

        // Do any additional setup after loading the view.
    }



}

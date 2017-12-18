//
//  Registration.swift
//  Authorization
//
//  Created by admin on 06.02.17.
//  Copyright © 2017 admin. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class Registration: UIViewController {
    
    var tableItems: [Table] = []

    @IBOutlet var fieldRegistrationName: UITextField!

    @IBOutlet var fieldRegistrationEmail: UITextField!
    
    @IBOutlet var fieldRegistrationLogin: UITextField!
    
    @IBOutlet var fieldRegistrationPass: UITextField!
    
    @IBAction func buttonRegister(_ sender: UIButton) {
        if ((fieldRegistrationName.text != "") && (fieldRegistrationEmail.text != "") && (fieldRegistrationLogin.text != "") && (fieldRegistrationPass.text != "")) {
            saveData() }
        else {labelRegistrationResult.text = "Some fields are empty."}
    }
    @IBOutlet weak var labelRegistrationResult: UILabel!
    
    func saveData() {
        var regBool: Bool = false
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
              let entity = NSEntityDescription.entity(forEntityName: "Table", in: context)
        let tableObject = NSManagedObject(entity: entity!, insertInto: context) as! Table
        let fetchRequest: NSFetchRequest<Table> = Table.fetchRequest()
       
  
        
        do {
            tableItems = try context.fetch(fetchRequest)
        } catch {
            print(error.localizedDescription)
        }
        
        for i in tableItems {
            if (self.fieldRegistrationLogin.text == i.login) && (self.fieldRegistrationLogin.text != nil) {
                regBool = true
            }
        
        }
        
        if regBool != true {
        
        do {
            tableObject.name = fieldRegistrationName.text
            tableObject.email = fieldRegistrationEmail.text
            tableObject.login = fieldRegistrationLogin.text
            tableObject.pass = fieldRegistrationPass.text
        try context.save()
         tableItems.append(tableObject)
            print("Saved!")
            labelRegistrationResult.text = "Registration succesful."
        }
        catch {
        print(error.localizedDescription)
        }
        } else {labelRegistrationResult.text = "Account already exists."
        
        }
        
    }

    override func viewWillAppear(_ animated: Bool) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Table> = Table.fetchRequest()
        do {
            tableItems = try context.fetch(fetchRequest)
        } catch {
            print(error.localizedDescription)
        }
    

    }
    
    override func viewDidLoad() {
        
    }
    
    
    
}

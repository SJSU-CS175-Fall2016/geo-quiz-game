//
//  TableViewController.swift
//  GeoQuiz
//
//  Created by Joan sirma on 12/16/16.
//  Copyright © 2016 Joan sirma. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    weak var model: Countries?
    var correctCapital: String?
    var mapView = MapController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print("in get's in here")
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        model = appDelegate.model
        if correctCapital != nil{
            print("CORRECT! : \(correctCapital!)")
            model?.capitalChoicesList.removeAll()
            model?.setRandomChoiceList(correctCapital: correctCapital!)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        print("sections")
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print("rows")
        return 4
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        print("cell")
        if model?.capitalChoicesList.count != 0
        {
            cell.textLabel?.text = model?.capitalChoicesList[indexPath.row]
        }
        else{
           
           cell.textLabel?.text = "Go Back to Map"
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("selected row number \(indexPath.row)")
        if(model?.capitalChoicesList[indexPath.row] == correctCapital)
        {
            model?.increaseScore()
            if let index = model?.listOfCountries.index(where:{($0 as! Location).capital == correctCapital})
            {
                model?.listOfCountries.remove(at: index)
            }
            
        }
        let message = "Correct answer: \(correctCapital!) \nYour answer: \(model!.capitalChoicesList[indexPath.row])\nYour score is:\(model!.score)"
        let alert = UIAlertController(title: "Answer", message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK",style: .default, handler: {action in self.performSegue(withIdentifier: "backToMap", sender: self)}))
        self.present(alert, animated: true, completion: nil)
        
    }
}

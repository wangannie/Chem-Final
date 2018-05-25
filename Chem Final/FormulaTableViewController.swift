//
//  FormulaTableViewController.swift
//  Chem Final
//
//  Created by Annie Wang on 5/24/18.
//  Copyright © 2018 Annie Wang. All rights reserved.
//

import UIKit

class FormulaTableViewController: UITableViewController {
    //MARK: Properties
    var formulas = [Formula]()

    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadFormulas()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return formulas.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "FormulaListTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? FormulaListTableViewCell else {
            fatalError("The cell is not an instance of FormulaListTableViewCell")
        }
        
        let formula = formulas[indexPath.row]
        
        cell.nameLabel.text = formula.name
        
        return cell
    }
    private func loadFormulas(){
        var arrVarsE1 = [Variable(symbol: "R", name: "gas constant", orient: "R", negative: false, value: 0.08206),Variable(symbol: "P", name: "pressure", orient: "L", negative: false),Variable(symbol: "V", name: "volume", orient: "L", negative: false), Variable(symbol: "n", name: "moles", orient: "R", negative: false),Variable(symbol: "T", name: "temperature", orient: "R", negative: false)]
        let eq1 = Formula(name: "Ideal Gas Law", vars: arrVarsE1)
        
        var arrVarsE2 = [Variable(symbol: "h", name: "Planck's constant", orient: "R", negative: false, value: 6.626e-34),Variable(symbol: "E", name: "energy", orient: "L", negative: false),Variable(symbol: "v", name: "frequency", orient: "R", negative: false)]
        let eq2 = Formula(name: "Planck's Equation", vars: arrVarsE2)
        
        
        var arrVarsE3 = [Variable(symbol: "c", name: "speed of light", orient: "L", negative: false, value: 2.998e8),Variable(symbol: "λ", name: "wavelength", orient: "R", negative: false),Variable(symbol: "v", name: "frequency", orient: "R", negative: false)]
        let eq3 = Formula(name: "Wavelength to frequency", vars: arrVarsE3)
        
        
        var arrVarsE4 = [Variable(symbol: "F", name: "Faraday's constant", orient: "R", negative: false, value: 96485),Variable(symbol: "n", name: "moles", orient: "R", negative: true),Variable(symbol: "E°", name: "standard cell potential", orient: "R", negative: false),Variable(symbol: "ΔG°", name: "standard free energy", orient: "L", negative: false)]
        let eq4 = Formula(name: "Standard Gibb's Energy change", vars: arrVarsE4)
        
        var arrVarsE5 = [Variable(symbol: "ln(2)", name: "ln(2)", orient: "R", negative: false, value: 0.693),Variable(symbol: "t(1/2)", name: "half-life", orient: "L", negative: true),Variable(symbol: "k", name: "rate constant", orient: "L", negative: false)]
        let eq5 = Formula(name: "Half-life equation", vars: arrVarsE5)
        
        var arrVarsE6 = [Variable(symbol: "q", name: "heat", orient: "L", negative: true),Variable(symbol: "m", name: "mass", orient: "R", negative: false),Variable(symbol: "c", name: "specific heat capacity", orient: "R", negative: false), Variable(symbol: "ΔT", name: "temperature change", orient: "R", negative: false)]
        let eq6 = Formula(name: "Half-life equation", vars: arrVarsE6)
        
        formulas += [eq1,eq2,eq3, eq4, eq5, eq6]
        
    }
}

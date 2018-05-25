//
//  EquationCollectionViewController.swift
//  Chem Final
//
//  Created by Annie Wang on 5/24/18.
//  Copyright © 2018 Annie Wang. All rights reserved.
//

import UIKit

private let reuseIdentifier = "equationCell"

class EquationCollectionViewController: UICollectionViewController{
    
    var formulas = [Formula]()
    
    var selectedIndexes = [NSIndexPath]() {
        didSet {
            collectionView?.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        loadFormulas()
        collectionView?.delegate = self
        collectionView?.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
//    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        performSegue(withIdentifier: "showCalculator", sender: indexPath)
//    }
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        
//        if segue.identifier == "showCalculator" {
//            let toViewController = segue.destination as! ViewController
//            let indexPath = sender as! IndexPath
//            let formula = formulas[indexPath.row]
//            toViewController.pvnrt = formula
//        }
//        
//    }
    
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return formulas.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? EquationCollectionViewCell else { fatalError ("wrong")}
        
        let formula = formulas[indexPath.item]
        
        cell.nameLabel.text = formula.name
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    
    //      Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    //        override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
    //            return true
    //        }
    //
    //        override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
    //            return true
    //        }
    //
    //        override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    //
    //            print ("plsss")
    //        }
    //
    
    
    //    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
    //
    //        // Create a variable that you want to send based on the destination view controller
    //        // You can get a reference to the data by using indexPath shown below
    //        let selectedFormula = formulas[indexPath.item]
    //
    //        let destinationVC = ViewController()
    //        destinationVC.pvnrt = selectedFormula
    //
    //        destinationVC.performSegue(withIdentifier: "showCalculator", sender: self)
    //    }
    //
    
    
    
    
    
    //
    //    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath){
    //        // ...
    //        if let indexSelecionado = selectedIndexes .indexOf(indexPath) {
    //            selectedIndexes.removeAtIndex(indexSelecionado)
    //        } else {
    //            selectedIndexes.append(indexPath)
    //        }
    //    }
    //
    //    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    //        // ...
    //        if self.selectedIndexes.indexOf(indexPath) == nil {
    //            cell.backgroundColor = UIColor.whiteColor() // Unselected
    //        } else {
    //            cell.backgroundColor = UIColor.redColor() // Selected
    //        }
    //        return cell
    //    }
    
    
    //        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //           print(segue.source.parent?.description)
    //
    //            if let viewControllerB = segue.destination as? ViewController {
    //
    //            }
    //
    //        }
    
    
    //    - (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    //    [self performSegueWithIdentifier:@"showCalculator" sender:self];
    //    }
    
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
        let eq6 = Formula(name: "Heat formula", vars: arrVarsE6)
        
        var arrVarsE7 = [Variable(symbol: "q", name: "heat", orient: "L", negative: true),Variable(symbol: "m", name: "mass", orient: "R", negative: false),Variable(symbol: "c", name: "specific heat capacity", orient: "R", negative: false), Variable(symbol: "ΔT", name: "temperature change", orient: "R", negative: false)]
        let eq7 = Formula(name: "Heat formula", vars: arrVarsE7)
        var arrVarsE8 = [Variable(symbol: "q", name: "heat", orient: "L", negative: true),Variable(symbol: "m", name: "mass", orient: "R", negative: false),Variable(symbol: "c", name: "specific heat capacity", orient: "R", negative: false), Variable(symbol: "ΔT", name: "temperature change", orient: "R", negative: false)]
        let eq8 = Formula(name: "Heat formula", vars: arrVarsE8)
        
        formulas += [eq1,eq2,eq3, eq4, eq5, eq6, eq7, eq8]
        
    }
    
}


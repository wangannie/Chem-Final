//
//  ViewController.swift
//  Chem Final
//
//  Created by Annie Wang on 5/18/18.
//  Copyright © 2018 Annie Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var navTitle: UINavigationItem!
    @IBOutlet weak var btnSolveFor: UIButton!
    
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var lblVar1: UILabel!
    @IBOutlet weak var lblVar2: UILabel!
    @IBOutlet weak var lblVar3: UILabel!
    @IBOutlet weak var lblN1: UILabel!
    @IBOutlet weak var lblN2: UILabel!
    @IBOutlet weak var lblN3: UILabel!
    @IBOutlet weak var lblN4: UILabel!
    @IBOutlet weak var lblN5: UILabel!
    @IBOutlet weak var lblN6: UILabel!
    @IBOutlet weak var lblD1: UILabel!
    @IBOutlet weak var lblD2: UILabel!
    @IBOutlet weak var lblD3: UILabel!
    @IBOutlet weak var lblD4: UILabel!
    @IBOutlet weak var lblD5: UILabel!
    @IBOutlet weak var lblD6: UILabel!
    @IBOutlet weak var lblSolve: UILabel!
    @IBOutlet weak var formattxt: UITextField!
    @IBOutlet weak var divBar: UILabel!
    @IBOutlet weak var lblAns: UILabel!
    @IBOutlet weak var txtVar1: UITextField!
    @IBOutlet weak var txtVar2: UITextField!
    @IBOutlet weak var txtVar3: UITextField!
    
    var eqNum = 1
    
    func showCalculator(Sender: UIButton!) {
        let secondViewController:ViewController = UIViewController() as! ViewController
        
        self.present(secondViewController, animated: true, completion: nil)
        
    }
    @IBOutlet weak var EqPicker: UIPickerView!
    @IBAction func eq2(_ sender: Any) {
        eqNum = 2
    }
    @IBAction func eq3(_ sender: Any) {
        eqNum = 3
    }
    @IBAction func eq4(_ sender: Any) {
        eqNum = 4
    }
    @IBAction func eq5(_ sender: Any) {
        eqNum = 5
    }
    @IBAction func eq6(_ sender: Any) {
        eqNum = 1
    }
    
    
    
    @IBAction func editTxtVar1(_ sender: Any) {
        enterTextField(variableIndex: 0)
    }
    @IBAction func editTxtVar2(_ sender: Any) {
        enterTextField(variableIndex: 1)
    }
    @IBAction func editTxtVar3(_ sender: Any) {
        enterTextField(variableIndex: 2)
    }
    @IBAction func getValVar1(_ sender: Any) {
        exitTextField(variableIndex: 0)
    }
    @IBAction func getValVar2(_ sender: Any) {
        exitTextField(variableIndex: 1)
    }
    @IBAction func getValVar3(_ sender: Any) {
        exitTextField(variableIndex: 2)
    }
    @IBAction func solveForPressed(_ sender: UIButton) {
        if picker.isHidden{
            picker.isHidden = false
        }
    }
    
    
    @IBAction func eqPickerPressed(_ sender: Any) {
        if EqPicker.isHidden{
            EqPicker.isHidden = false
        }
    }
    
    let btnBlue = UIColor(red: CGFloat(0/255.0), green: CGFloat(122/255.0), blue: CGFloat(255.0/255.0), alpha: CGFloat(1.0));
    let shadowGray = UIColor(red: CGFloat(0/255.0), green: CGFloat(0/255.0), blue: CGFloat(0/255.0), alpha: CGFloat(0.3));
    var labelText = "initial"
    var orient = ""
    var eqName = "Equation Name"
    
    //var arrVars : [Variable] = []
    
    //    [Variable(symbol: "R", name: "gas constant", orient: "R", negative: false, value: 0.08206),Variable(symbol: "P", name: "pressure", orient: "L", negative: false),Variable(symbol: "V", name: "volume", orient: "L", negative: false), Variable(symbol: "n", name: "moles", orient: "R", negative: false),Variable(symbol: "T", name: "temperature", orient: "R", negative: false)]
    
    var arrVarsE1 = [Variable(symbol: "R", name: "gas constant", orient: "R", negative: false, value: 0.08206),Variable(symbol: "P", name: "pressure", orient: "L", negative: false),Variable(symbol: "V", name: "volume", orient: "L", negative: false), Variable(symbol: "n", name: "moles", orient: "R", negative: false),Variable(symbol: "T", name: "temperature", orient: "R", negative: false)]
    lazy var eq1 = Formula(name: "Ideal Gas Law", vars: arrVarsE1)
    
    var arrVarsE2 = [Variable(symbol: "h", name: "Planck's constant", orient: "R", negative: false, value: 6.626e-34),Variable(symbol: "E", name: "energy", orient: "L", negative: false),Variable(symbol: "v", name: "frequency", orient: "R", negative: false)]
    lazy var eq2 = Formula(name: "Planck's Equation", vars: arrVarsE2)
    
    
    var arrVarsE3 = [Variable(symbol: "c", name: "speed of light", orient: "L", negative: false, value: 2.998e8),Variable(symbol: "λ", name: "wavelength", orient: "R", negative: false),Variable(symbol: "v", name: "frequency", orient: "R", negative: false)]
    lazy var eq3 = Formula(name: "Wavelength to frequency", vars: arrVarsE3)
    
    
    var arrVarsE4 = [Variable(symbol: "F", name: "Faraday's constant", orient: "R", negative: false, value: 96485),Variable(symbol: "n", name: "moles", orient: "R", negative: true),Variable(symbol: "E°", name: "standard cell potential", orient: "R", negative: false),Variable(symbol: "ΔG°", name: "standard free energy", orient: "L", negative: false)]
    lazy var eq4 = Formula(name: "Standard Gibb's Energy change", vars: arrVarsE4)
    
    var arrVarsE5 = [Variable(symbol: "ln(2)", name: "ln(2)", orient: "R", negative: false, value: 0.693),Variable(symbol: "t(1/2)", name: "half-life", orient: "L", negative: true),Variable(symbol: "k", name: "rate constant", orient: "L", negative: false)]
    lazy var eq5 = Formula(name: "Half-life equation", vars: arrVarsE5)
    
    var arrVarsE6 = [Variable(symbol: "q", name: "heat", orient: "L", negative: true),Variable(symbol: "m", name: "mass", orient: "R", negative: false),Variable(symbol: "c", name: "specific heat capacity", orient: "R", negative: false), Variable(symbol: "ΔT", name: "temperature change", orient: "R", negative: false)]
    lazy var eq6 = Formula(name: "Heat formula", vars: arrVarsE6)
    
    
    
    var pvnrt : Formula = Formula()
    var formulas = [Formula]()
    //= Formula(name: "Ideal Gas Law", vars: arrVars)
    
    private var arrVarLabels = [UILabel]()
    private var lblNumerators = [UILabel]()
    private var lblDenominators = [UILabel]()
    private var arrVarTexts = [UITextField]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        formulas = [eq1,eq2,eq3, eq4, eq5, eq6]
        
        arrVarLabels.append(lblVar1)
        arrVarLabels.append(lblVar2)
        arrVarLabels.append(lblVar3)
        
        lblNumerators.append(lblN1)
        lblNumerators.append(lblN2)
        lblNumerators.append(lblN3)
        lblNumerators.append(lblN4)
        lblNumerators.append(lblN5)
        lblNumerators.append(lblN6)
        
        lblDenominators.append(lblD1)
        lblDenominators.append(lblD2)
        lblDenominators.append(lblD3)
        lblDenominators.append(lblD4)
        lblDenominators.append(lblD5)
        lblDenominators.append(lblD6)
        
        arrVarTexts.append(txtVar1)
        arrVarTexts.append(txtVar2)
        arrVarTexts.append(txtVar3)
        
        lblAns.isHidden = true
        picker.isHidden = true
        EqPicker.isHidden = true
        self.picker.delegate = self
        self.picker.dataSource = self
        
        self.EqPicker.delegate = self
        self.EqPicker.dataSource = self
        
        navTitle.title = pvnrt.name
        setEquationForm(formtoset: formulas[0])
        self.hideKeyboardWhenTappedAround()
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier != "back") {
            eqNum = Int(segue.identifier!)!
            // pass data to next view
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(pickerView.tag == 0){
            return pvnrt.varCount()
        }else{
            return formulas.count
        }
    }
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(pickerView.tag == 0){
            return pvnrt.getVarNames()[row]
        }else{
            return formulas[row].name
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(pickerView.tag == 0){
            resetForm(solveVar: pvnrt.getVarNames()[row])
        }
        else{
            setEquationForm(formtoset: formulas[row])
        }
    }
    
    
    func hideFormula (){
        for label in lblNumerators{
            label.isHidden = true
        }
        for label in lblDenominators{
            label.isHidden = true
        }
        divBar.isHidden = true
        lblAns.isHidden = false
    }
    func showFormula(){
        for label in lblNumerators{
            label.isHidden = false
        }
        for label in lblDenominators{
            label.isHidden = false
        }
        divBar.isHidden = false
        lblAns.isHidden = true
    }
    
    func calculate (method : String) -> Double{
        if (method == "md"){
            var num = 1.0
            var denom = 1.0
            var sign = 1.0
            for v in pvnrt.vars{
                if v.hasValue(){
                    sign = 1.0
                    if v.negative{ sign = -1.0 }
                    if v.orient == orient{ denom *= v.value * sign }
                    else{ num *= v.value * sign }
                }
            }
            
            if pvnrt.varNamed(btnSolveFor.currentTitle!).negative{
                denom *= -1
            }
            return (num/denom)
        }
        else if (method == "as"){
            
        }
        else if (method == "log"){
            
        }
        return 0
    }
    func checkCompletion(){
        if pvnrt.isComplete(){
            hideFormula()
            lblAns.text = "\(round(calculate(method: "md"), to:  10))"
            
        }else{
            lblAns.text = ""
            showFormula()
        }
    }
    @IBOutlet weak var EqTitleButton: UIButton!
    func setEquationForm (formtoset : Formula){
        EqTitleButton.setTitle(formtoset.name, for: .normal)
        EqTitleButton.isEnabled = true
        EqPicker.isHidden=true
        pvnrt = formtoset
        
        resetForm(solveVar: (pvnrt.firstVar().name))
    }
    
    func resetForm (solveVar : String){
        EqTitleButton.setTitle(pvnrt.name, for: .normal)
        btnSolveFor.setTitle(solveVar, for: .normal)
        btnSolveFor.isEnabled = true
        picker.isHidden=true
        var i = 0
        for variable in pvnrt.getVarNames(){
            if (variable != solveVar){
                arrVarLabels[i].text = variable
                i += 1
            }
        }
        for variable in pvnrt.getVarsOnly(){
            if (variable.name == solveVar){
                lblSolve.text = variable.symbol
            }
        }
        
        orient = pvnrt.varNamed(solveVar).orient
        
        for element in lblNumerators{
            element.text = ""
            element.frame.origin.y = 225
        }
        for element in lblDenominators{
            element.text = ""
            
        }
        divBar.alpha = 1.0
        
        var numerator = 0
        var denominator = 0
        
        for variable in pvnrt.vars{
            if(variable.name != solveVar){
                if (variable.orient == orient){
                    lblDenominators[denominator].text = variable.symbol
                    denominator += 1
                }else{
                    lblNumerators[numerator].text = variable.symbol
                    numerator += 1
                }
            }
        }
        if(denominator == 0){
            divBar.alpha = 0.0
            for lbl in lblNumerators {
                lbl.frame.origin.y = lblAns.frame.origin.y
            }
        }
        
        for txtF in arrVarTexts {
            txtF.text = ""
            txtF.isEnabled = true
            restoreDefaultText(txtField: txtF)
        }
        showFormula()
        initEnteredData()
        hideAllVarLblTxt()
        let numVarLabels = pvnrt.varCount() - 1
        for index in 0...(numVarLabels - 1) {
            arrVarTexts[index].isHidden = false
            arrVarLabels[index].isHidden = false
        }
        picker.reloadAllComponents()
        
    }
    func hideAllVarLblTxt(){
        for text in arrVarTexts{
            text.isHidden = true
        }
        for lbl in arrVarLabels{
            lbl.isHidden = true
        }
    }
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    func initEnteredData (){
        pvnrt.clearData()
    }
    func enterTextField (variableIndex : Int){
        let varText = arrVarTexts[variableIndex]
        selectText(txtField: varText)
        for label in lblNumerators{
            if (label.text != "") {
                if label.text! == pvnrt.varNamed(varText.text!).name{
                    selectVarLabel(label: label)
                }
            }
        }
        for label in lblDenominators{
            if (label.text != "") {
                if label.text! == pvnrt.varNamed(varText.text!).name{
                    selectVarLabel(label: label)
                }
            }
        }
    }
    func selectText (txtField : UITextField){
        txtField.layer.borderWidth = 1
        txtField.layer.borderColor = btnBlue.cgColor
        txtField.layer.shadowColor = UIColor.black.cgColor
        txtField.layer.shadowOpacity = 0.3
        txtField.layer.shadowOffset = CGSize(width: -1, height: 1)
        txtField.layer.shadowRadius = 5
    }
    
    func selectVarLabel (label : UILabel){
        label.textColor = btnBlue
    }
    
    func unselectVarLabel (){
        for num in lblNumerators{
            num.textColor = UIColor.black
        }
        for den in lblDenominators{
            den.textColor = UIColor.black
        }
    }
    
    func doneText (txtField : UITextField){
        txtField.layer.borderWidth = 0.5
        txtField.layer.borderColor = UIColor.black.cgColor
        txtField.layer.shadowRadius = 0
    }
    
    func restoreDefaultText (txtField : UITextField){
        txtField.borderStyle = formattxt.borderStyle
        txtField.layer.borderWidth = formattxt.layer.borderWidth
        txtField.layer.shadowOffset = formattxt.layer.shadowOffset
        txtField.layer.shadowRadius = formattxt.layer.shadowRadius
        txtField.layer.borderColor = formattxt.layer.borderColor
        txtField.layer.shadowOpacity = formattxt.layer.shadowOpacity
    }
    func exitTextField (variableIndex : Int){
        let varText = arrVarTexts[variableIndex]
        let varLabel = arrVarLabels[variableIndex]
        
        for variable in pvnrt.getVarsOnly(){
            if (variable.name == varLabel.text){
                if varText.text != ""{
                    variable.setValue(Double(varText.text!)!)
                    doneText(txtField: varText)
                }else{
                    restoreDefaultText(txtField: varText)
                    variable.clearValue()
                }
            }
            doneText(txtField: varText)
        }
        unselectVarLabel()
        checkCompletion()
    }
    
    func round(_ num: Double, to places: Int) -> Double {
        let p = log10(abs(num))
        let f = pow(10, p.rounded() - Double(places) + 1)
        let rnum = (num / f).rounded() * f
        
        return rnum
    }
    
    func round(_ num: Int, to places: Int) -> Int {
        let p = log10(abs(Double(num)))
        let f = pow(10, p.rounded() - Double(places) + 1)
        let rnum = (Double(num) / f).rounded() * f
        
        return Int(rnum)
    }
    
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension Array where Element : Collection {
    subscript(column column : Element.Index) -> [ Element.Iterator.Element ] {
        return map { $0[ column ] }
    }
}

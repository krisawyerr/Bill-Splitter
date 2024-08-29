import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var splitAmountLabel: UILabel!
    @IBOutlet weak var zeroPercent: UIButton!
    @IBOutlet weak var tenPercent: UIButton!
    @IBOutlet weak var twentyPercent: UIButton!
    @IBOutlet weak var numberInput: UITextField!
    
    var cost = 100.00
    var percent = 1.00
    var splitAmount = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberInput.keyboardType = .decimalPad
        addDoneButtonOnKeyboard()
        
        numberInput.attributedPlaceholder = NSAttributedString(
            string: "e.g. 151.73",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
    }
    
    @IBAction func priceChanged(_ sender: Any) {
        cost = Double(numberInput.text!)!
    }
    
    @IBAction func changedTipAmount(_ sender: UIButton) {
        switch sender.currentTitle {
        case "0%":
            percent = 1.00
            sender.backgroundColor = UIColor(red: 69/255.0, green: 184/255.0, blue: 135/255.0, alpha: 1.0)
            sender.setTitleColor(UIColor.white, for: .normal)
            tenPercent.setTitleColor(UIColor(red: 69/255.0, green: 184/255.0, blue: 135/255.0, alpha: 1.0), for: .normal)
            tenPercent.backgroundColor = UIColor(red: 231/255.0, green: 250/255.0, blue: 244/255.0, alpha: 1.0)
            twentyPercent.setTitleColor(UIColor(red: 69/255.0, green: 184/255.0, blue: 135/255.0, alpha: 1.0), for: .normal)
            twentyPercent.backgroundColor = UIColor(red: 231/255.0, green: 250/255.0, blue: 244/255.0, alpha: 1.0)
        case "10%":
            percent = 1.10
            sender.backgroundColor = UIColor(red: 69/255.0, green: 184/255.0, blue: 135/255.0, alpha: 1.0)
            sender.setTitleColor(UIColor.white, for: .normal)
            zeroPercent.setTitleColor(UIColor(red: 69/255.0, green: 184/255.0, blue: 135/255.0, alpha: 1.0), for: .normal)
            zeroPercent.backgroundColor = UIColor(red: 231/255.0, green: 250/255.0, blue: 244/255.0, alpha: 1.0)
            twentyPercent.setTitleColor(UIColor(red: 69/255.0, green: 184/255.0, blue: 135/255.0, alpha: 1.0), for: .normal)
            twentyPercent.backgroundColor = UIColor(red: 231/255.0, green: 250/255.0, blue: 244/255.0, alpha: 1.0)
        case "20%":
            percent = 1.20
            sender.backgroundColor = UIColor(red: 69/255.0, green: 184/255.0, blue: 135/255.0, alpha: 1.0)
            sender.setTitleColor(UIColor.white, for: .normal)
            tenPercent.setTitleColor(UIColor(red: 69/255.0, green: 184/255.0, blue: 135/255.0, alpha: 1.0), for: .normal)
            tenPercent.backgroundColor = UIColor(red: 231/255.0, green: 250/255.0, blue: 244/255.0, alpha: 1.0)
            zeroPercent.setTitleColor(UIColor(red: 69/255.0, green: 184/255.0, blue: 135/255.0, alpha: 1.0), for: .normal)
            zeroPercent.backgroundColor = UIColor(red: 231/255.0, green: 250/255.0, blue: 244/255.0, alpha: 1.0)
        default:
            print("Error")
            sender.backgroundColor = UIColor(named: "#45B887")
            sender.setTitleColor(UIColor.white, for: .normal)
        }
    }
    
    
    @IBAction func changeSplitAmount(_ sender: UIStepper) {
        splitAmountLabel.text = "\(Int(sender.value))"
        splitAmount = Int(sender.value)
    }
    
    func addDoneButtonOnKeyboard() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneButtonTapped))
        toolbar.setItems([flexibleSpace, doneButton], animated: true)
        
        numberInput.inputAccessoryView = toolbar
    }
    
    @objc func doneButtonTapped() {
        view.endEditing(true)
    }
}

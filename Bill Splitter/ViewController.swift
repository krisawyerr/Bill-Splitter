import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var numberInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        numberInput.keyboardType = .decimalPad
        addDoneButtonOnKeyboard()
        
        numberInput.attributedPlaceholder = NSAttributedString(
            string: "e.g. 151.73",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
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

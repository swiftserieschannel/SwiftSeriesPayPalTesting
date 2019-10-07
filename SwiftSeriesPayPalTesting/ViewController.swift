//
//  ViewController.swift
//  SwiftSeriesPayPalTesting
//
//  Created by chander bhushan on 07/10/19.
//  Copyright © 2019 swiftseries. All rights reserved.
//

import UIKit
import Braintree
class ViewController: UIViewController {

    var braintreeClient: BTAPIClient!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        braintreeClient = BTAPIClient(authorization: "<Place you tokenization key here>")
        
        
    }
    
    
    @IBAction func clickedBtnPay(_ sender: Any) {
        let payPalDriver = BTPayPalDriver(apiClient: braintreeClient)
        payPalDriver.viewControllerPresentingDelegate = self
        payPalDriver.appSwitchDelegate = self // Optional
        
        // Specify the transaction amount here. "2.32" is used in this example.
        let request = BTPayPalRequest(amount: "2.32")
        request.currencyCode = "USD" // Optional; see BTPayPalRequest.h for more options
        
        payPalDriver.requestOneTimePayment(request) { (tokenizedPayPalAccount, error) in
            if let tokenizedPayPalAccount = tokenizedPayPalAccount {
                print("Got a nonce: \(tokenizedPayPalAccount.nonce)")
                
                // Access additional information
                let email = tokenizedPayPalAccount.email
                debugPrint(email)
                let firstName = tokenizedPayPalAccount.firstName
                let lastName = tokenizedPayPalAccount.lastName
                let phone = tokenizedPayPalAccount.phone
                
                // See BTPostalAddress.h for details
                let billingAddress = tokenizedPayPalAccount.billingAddress
                let shippingAddress = tokenizedPayPalAccount.shippingAddress
            } else if let error = error {
                // Handle error here...
                print(error)
            } else {
                // Buyer canceled payment approval
            }
        }

    }
    

}

extension ViewController : BTViewControllerPresentingDelegate{
    func paymentDriver(_ driver: Any, requestsPresentationOf viewController: UIViewController) {
        
    }
    
    func paymentDriver(_ driver: Any, requestsDismissalOf viewController: UIViewController) {
        
    }
    
    
}

extension ViewController : BTAppSwitchDelegate {
    func appSwitcherWillPerformAppSwitch(_ appSwitcher: Any) {
        
    }
    
    func appSwitcher(_ appSwitcher: Any, didPerformSwitchTo target: BTAppSwitchTarget) {
        
    }
    
    func appSwitcherWillProcessPaymentInfo(_ appSwitcher: Any) {
        
    }
    
    
}

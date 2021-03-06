//
//  MailBoxLock.swift
//  MailboxSecured
//
//  Created by Benjamin Simpson on 1/30/21.
//

import Foundation
import UIKit
import Toast_Swift

class MailBoxLock: UIViewController {
    
    var notifyAlert = ToastStyle()
    
    let mailboxLock: UISegmentedControl = {
        let control = UISegmentedControl()
        control.translatesAutoresizingMaskIntoConstraints = false
        control.backgroundColor = .systemBlue
        return control
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupControl()
        self.view.backgroundColor = .white
    }
    
    func setupControl(){
        mailboxLock.insertSegment(withTitle: "Lock", at: 0, animated: true)
        mailboxLock.insertSegment(withTitle: "Unlock", at: 1, animated: true)
        mailboxLock.selectedSegmentIndex = 0
        mailboxLock.addTarget(self, action: #selector(key), for: .valueChanged)
        self.view.addSubview(mailboxLock)
        mailboxLock.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 275).isActive = true
        mailboxLock.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        mailboxLock.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        mailboxLock.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
    @objc func key(){
        switch mailboxLock.selectedSegmentIndex {
        case 0:
            print("locked")
            notifyAlert.messageColor = .white
            self.view.makeToast("Mailbox is Secured", duration: 2.0, position: .bottom, style: notifyAlert)
        case 1:
            print("unlocked")
            notifyAlert.messageColor = .green
            self.view.makeToast("Mailbox is Unlocked", duration: 2.0, position: .bottom, style: notifyAlert)
        default:
            break
        }
    }
    
    
}

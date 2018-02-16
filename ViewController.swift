//
//  ViewController.swift
//  PfIReConsent
//
//  Created by Karlin, Daniel on 10/12/17.
//  Copyright © 2017 Pfizer. All rights reserved.
//

import UIKit
import ResearchKit
import BoxContentSDK
import MessageUI

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    //MARK: Properties
    @IBOutlet weak var consentTapped: UIButton!
    @IBOutlet weak var userLoggedInButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var progressIndicator: UIProgressView!
    @IBOutlet weak var lastFileLabel: UITextView!
    @IBOutlet weak var studyPicker: UIPickerView!
    
    // Class wide variable for picker data
    var pickerData: [String] = [String]()

    // View Did Load Override
    override func viewDidLoad() {
        
        // Super view did Load
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        // Start spinner
        // Set up activity indicator
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle  = UIActivityIndicatorViewStyle.gray
        activityIndicator.center = view.center
        self.activityIndicator.startAnimating()
        
        // Connect data to picker
        self.studyPicker.delegate = self
        self.studyPicker.dataSource = self
        
        // Set up values for the picker
        for index in 0..<Constants.Studies.count {
            pickerData.append(Constants.Studies[index].Number)
        }
        
        // Set up last file name and links
        lastFileLabel.isEditable = false
        lastFileLabel.dataDetectorTypes = UIDataDetectorTypes.link
        
        // Set up for progress bar
        progressIndicator.isHidden = true
        
        // Set default for logged in button/label
        self.userLoggedInButton.setTitle(Constants.LiveUser, for: .normal)
        // Box Login
        self.logInUser()
        // Stop spinner
        self.activityIndicator.stopAnimating()
    }
    
    // Function Called to Test Whether The Logged in User Can Access Correct Folders
    func testUserReadiness () {
        self.activityIndicator.startAnimating()
        //Check whether current user can access correct folder
        let contentClient : BOXContentClient = BOXContentClient.default()
        let testUploadRequest: BOXPreflightCheckRequest = contentClient.fileUploadPreflightCheckRequestForNewFileInFolder(withID: Constants.Keys.boxFolderID, name: "testUpload.pdf", size: 10)
        testUploadRequest.perform(completion: { (error: Error?) -> Void in
            if (error == nil )
            {
                Constants.userReady = true
                self.consentTapped.setTitle("eConsent", for: .normal)
                self.consentTapped.setTitleColor(.blue, for: .normal)
                // Check whether message can be sent
                if  (MFMessageComposeViewController.canSendText() ) { }
                else
                {
                    self.consentTapped.setTitle("eConsent (No Message)", for: .normal)
                }
            }
            else
            {
                Constants.userReady = false
                self.consentTapped.setTitle("Not Ready (Folder Access)", for: .normal)
                self.consentTapped.setTitleColor(.red, for: .normal)
            }
        })
        self.activityIndicator.stopAnimating()
    }
    
    // Fnction Called to Log In A User
    func logInUser () {
        BOXContentClient.default().authenticate(completionBlock: { ( user : BOXUser? , error : Error? ) -> Void in
            if (error == nil )
            {
                Constants.LiveUser = (user?.login!)! as String
                self.userLoggedInButton.setTitle(Constants.LiveUser, for: .normal)
                //Check whether current user can access correct folder
                self.testUserReadiness()
            }
            else
            {
                // If user not logged in set all variables appropriately
                Constants.LiveUser = "Not Logged In"
                Constants.userReady = false
                self.userLoggedInButton.setTitle(Constants.LiveUser, for: .normal)
                self.consentTapped.setTitle("Not Ready (User)", for: .normal)
                self.consentTapped.setTitleColor(.red, for: .normal)
            }
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Define pickerview components
    // Number of components
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    // Catpure the picker view selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
        Constants.LiveStudy = row
    }
    
    // Tap consent button
    @IBAction func consentTapped(_ sender: Any) {
        testUserReadiness()
        if Constants.userReady == true
        {
            let taskViewController = ORKTaskViewController(task: ConsentTask, taskRun: nil)
            taskViewController.delegate = self
            present(taskViewController, animated: true, completion: nil)
        }
        else
        {
            // Indication to user that the user is not logged in or able to upload to the right folder.
            // self.consentTapped.setTitle("Not Ready", for: .normal)
            // self.consentTapped.setTitleColor(.red, for: .normal)
        }
    }
    
    // Click username on the bottom of the main screen. Logs out and logs back in.
    @IBAction func userLoggedInButton(_ sender: Any) {
        // Log Out Users
        self.activityIndicator.startAnimating()
        BOXContentClient.logOutAll()
        
        // Set All Screen Variables to be Consistent with All Logged Out
        Constants.LiveUser = "Not Logged In"
        self.userLoggedInButton.setTitle(Constants.LiveUser, for: .normal)
        Constants.userReady = false
        
        // Call Log In Function
        self.logInUser()
        self.activityIndicator.stopAnimating()
    }
    
    //Build Alert
    func showAlert(dispTitle: String, dispMessage: String) {
        let alert = UIAlertController(title: dispTitle, message: dispMessage, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    // Function to send link via message
    func sendLinkByMessage (fileSharedUrl: String) {
        //Check to see the device can send email.
        if (MFMessageComposeViewController.canSendText() ) {
            // print("Can send message.")
            let messageComposer = MFMessageComposeViewController()
            messageComposer.messageComposeDelegate = self as MFMessageComposeViewControllerDelegate
            // Set the message
            messageComposer.body = fileSharedUrl
            self.present(messageComposer, animated: true, completion: nil)
        }
        else {
            // showAlert(dispTitle: "Can't Send Message", dispMessage: "Share this manually: \(fileSharedUrl)")
            // print ("Can't Send Message")
            self.showAlert(dispTitle: "Manually Share", dispMessage: fileSharedUrl)
        }
    }
}

// Deal with message send completion
extension ViewController: MFMessageComposeViewControllerDelegate {
    func messageComposeViewController(_ messageComposeViewControllercontroller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        switch (result.rawValue) {
        case MessageComposeResult.cancelled.rawValue:
            print("Message was cancelled")
            self.dismiss(animated: true, completion: nil)
        case MessageComposeResult.failed.rawValue:
            print("Message failed")
            self.dismiss(animated: true, completion: nil)
        case MessageComposeResult.sent.rawValue:
            print("Message was sent")
            self.dismiss(animated: true, completion: nil)
        default:
            print("Message send case ended up in default")
            self.dismiss(animated: true, completion: nil)
        }
    }
}
// Deal with finishing Consent Task
extension ViewController: ORKTaskViewControllerDelegate {
    func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?) {
        //Handle results with taskViewController.result
        // Switch Based on Return from ORKConsentTask
        switch reason {
        case .completed:
            // Start spinner
            self.activityIndicator.startAnimating()
            // Save onboarding result
            // Set date format for file name
            let date = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "MMddyyyy_HHmm"
            let dateResult = formatter.string(from: date)
            // Get signature from tasks and append to document
            let result = taskViewController.result
            let consentDocument = ConsentDocument
            if let stepResult = result.stepResult(forStepIdentifier: "ConsentReviewStep"),
                let signatureResult = stepResult.results?.first as? ORKConsentSignatureResult {
                // Set file name
                let fileName = "Consent_\(Constants.Studies[Constants.LiveStudy].Number)_\(signatureResult.signature!.familyName ?? "NoName")_\(dateResult).pdf"
                // Add sig to this document
                signatureResult.apply(to: consentDocument)
                consentDocument.makePDF { (data, error) -> Void in
                    var docURL = (FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)).last as NSURL?
                    docURL = docURL?.appendingPathComponent(fileName) as NSURL?
                    //write your file to the disk.
                    do {
                        try data?.write(to:docURL! as URL)
                    } catch let error {
                        print(error.localizedDescription)
                    }
                    // PDF is now on local disk
                    // Build upload request to Box
                    let contentClient : BOXContentClient = BOXContentClient.default()
                    let uploadRequest: BOXFileUploadRequest = contentClient.fileUploadRequestToFolder(withID: Constants.Keys.boxFolderID, fromLocalFilePath: docURL?.path)
                    self.progressIndicator.isHidden = false
                    // Perform upload request with progress bar potential
                    uploadRequest.perform(progress: { (_totalBytesTransferred, _totalBytesExpected) in
                        // This is where the progress bar would update
                        // Spinner on main screen during all of the following steps
                        self.progressIndicator.progress = Float(_totalBytesTransferred/_totalBytesExpected)
                        // print ("uploading")
                        // What follows is post upload completion
                    }, completion: { (newFile, error: Error? ) -> Void in
                        // Pick up file ID of the new file
                        self.progressIndicator.isHidden = true
                        self.activityIndicator.startAnimating()
                        let fileID = newFile?.modelID
                        // Set up file share process
                        let contentClientShare : BOXContentClient = BOXContentClient.default()
                        let shareRequest: BOXFileShareRequest = contentClientShare.sharedLinkCreateRequestForFile(withID: fileID)
                        // Process share request
                        shareRequest.perform(completion: { (shareFile, error: Error?) -> Void in
                            // With success of share request we have access to a shared URL
                            let fileURL = shareFile!.sharedLink.url.absoluteString
                            self.lastFileLabel.text = "\(fileName) \n\(fileURL)"
                            // print ("Shared Link: \(fileURL)")
                            self.sendLinkByMessage(fileSharedUrl: fileURL)
                            self.activityIndicator.stopAnimating()
                        })
                    })
                }
                // Dismiss task and onboarding controller
                // Stop and hide spinner after message send
                self.activityIndicator.stopAnimating()
                taskViewController.dismiss(animated: true, completion: nil)
            }
        case .discarded, .failed, .saved:
            // Only dismiss task controller
            // (back to onboarding controller)
            self.activityIndicator.stopAnimating()
            taskViewController.dismiss(animated: true, completion: nil)
        }
    }
}


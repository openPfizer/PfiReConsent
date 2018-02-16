//
//  ConsentTask.swift
//  PfIReConsent
//
//  Created by Karlin, Daniel on 10/12/17.
//  Copyright © 2017 PfIRe. All rights reserved.
//

import Foundation
import ResearchKit

public var ConsentTask: ORKOrderedTask {
    
    var steps = [ORKStep]()
    
    // VisualConsentStep
    let consentDocument = ConsentDocument
    let visualConsentStep = ORKVisualConsentStep(identifier: "VisualConsentStep", document: consentDocument)
    steps += [visualConsentStep]
    
    // TODO If needed: Add ConsentSharingStep
    
    //ConsentReviewStep
    let signature = consentDocument.signatures!.first as! ORKConsentSignature
    let reviewConsentStep = ORKConsentReviewStep(identifier: "ConsentReviewStep", signature: signature, in: consentDocument)
    reviewConsentStep.text = "Please type your name."
    reviewConsentStep.reasonForConsent = Constants.Studies[Constants.LiveStudy].SigConsentText
    steps += [reviewConsentStep]
    
    // Completion Step
    let completionStep = ORKCompletionStep(identifier: "CompletionStep")
    completionStep.title = NSLocalizedString("Welcome aboard!", comment: "")
    completionStep.text = NSLocalizedString("Thank you for joining this study.", comment: "")
    steps += [completionStep]
    
    // End of steps
    return ORKOrderedTask(identifier: "ConsentTask", steps: steps)
}

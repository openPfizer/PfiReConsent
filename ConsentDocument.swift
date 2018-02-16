//
//  ConsentDocument.swift
//  PfIReConsent
//
//  Created by Karlin, Daniel on 10/12/17.
//  Copyright © 2017 Pfizer. All rights reserved.
//

import Foundation
import ResearchKit
import BoxContentSDK

public var ConsentDocument: ORKConsentDocument {
    let consentDocument = ORKConsentDocument()
    consentDocument.title = Constants.Studies[Constants.LiveStudy].Name
    consentDocument.signaturePageTitle = Constants.Studies[Constants.LiveStudy].Name
    consentDocument.signaturePageContent = Constants.Studies[Constants.LiveStudy].SigConsentText + " Consent obtained by " + Constants.LiveUser
    // Consent Sections
    let consentSectionTypes = Constants.Studies[Constants.LiveStudy].consentSectionTypes
    // Consent Section Definitions
    // Iterate through the declared sections and attach relevant text
    var i = 0
    let consentSections: [ORKConsentSection] = consentSectionTypes.map { contentSectionType in
        let consentSection = ORKConsentSection(type: contentSectionType)
        consentSection.summary = Constants.Studies[Constants.LiveStudy].summaries[i]
        consentSection.content = Constants.Studies[Constants.LiveStudy].details[i]
        i += 1
        return consentSection
    }
    consentDocument.sections = consentSections
    // Signature
    // Note: An ORKConsentSignature can also be pre-populated with a name, image and date.
    // This is useful when you need to include a copy of the principal investigator’s signature in the consent document.
    let participantSignature = ORKConsentSignature(forPersonWithTitle: "Subject",
                                                     dateFormatString: nil,
                                                     identifier: "ConsentDocumentParticipantSignature")
    consentDocument.addSignature(participantSignature)
    
    // Add Investigator Sig
    let investigatorSignature = ORKConsentSignature(forPersonWithTitle: "Investigator",
                                                   dateFormatString: nil,
                                                   identifier: "ConsentDocumentInvestigatorSignature",
                                                   givenName: Constants.Studies[Constants.LiveStudy].PIFirstName,
                                                   familyName: Constants.Studies[Constants.LiveStudy].PILastName,
                                                   signatureImage: Constants.Studies[Constants.LiveStudy].PIsigImage,
                                                   dateString: Constants.Studies[Constants.LiveStudy].PIsigDate)
    consentDocument.addSignature(investigatorSignature)
    return consentDocument
}

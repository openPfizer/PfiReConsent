//
//  Constants.swift
//  PfIReConsent
//
//  Created by Dan Karlin on 10/17/17.
//  Copyright © 2017 Pfizer. All rights reserved.
//

import Foundation
import ResearchKit

struct Constants {
    struct Keys {
        //  Box Keys -- Supply Your Own
        static let boxClientID = "xxxx"
        static let boxClientSecret = "xxxx"
        static let boxFolderID = "xxxx"
    }
    
    // Initialize reference for which study is active, set by dropdown on main page
    static var LiveStudy: Int = 0
    
    // User info set on main page
    static var LiveUser: String = "No User Logged In"
    static var userReady: Bool = false
    
    // Declare structure that holds a study
    struct Study {
        var ID: Int
        var Number: String
        var Name: String
        var PIFirstName: String
        var PILastName: String
        var PIsigImage: UIImage
        var PIsigDate: String
        var SigConsentText: String
        var consentSectionTypes: [ORKConsentSectionType]
        var summaries: [String]
        var details: [String]
    }
    
    // Array of Struct Study
    static let Studies: [Study] = [
        //Declare study 1
        //static let Study1 = Study(
        Study(
            ID: 0,
            Number: "xxxxx",
            Name: "xxxx",
            PIFirstName: "xxxx",
            PILastName: "xxxx",
            PIsigImage: #imageLiteral(resourceName: "knee_flexed_right"),
            PIsigDate: "10/10/2010",
            SigConsentText: "I have read and understand the information in this informed consent document.  I have had an opportunity to ask questions, and all of my questions have been answered to my satisfaction. I voluntarily agree to participate in this study until I decide otherwise.  I do not give up any of my legal rights by signing this consent document.  I will receive a copy of this signed consent document.",
            consentSectionTypes: [
                .overview,
                .dataGathering,
                .privacy,
                .dataUse,
                .timeCommitment,
                .studySurvey,
                .studyTasks,
                .withdrawing
            ],
            summaries: [
                "Before agreeing to participate in this research study, it is important that you read and understand the following explanation of the study.  This consent document describes the purpose, procedures and risks of the study.  It also describes your right to withdraw from the study at any time. No guarantees or assurances can be made as to the results of the study.",
                "As an employee of the study sponsor, you are under no obligation to participate in this study.",
                "Records of your participation in this study will be held confidential except as disclosure is required by law or as described in this informed consent document.",
                "De-identified data without your name and/or birthdate may be shared with other investigators to allow for data analysis.",
                "Your participation in this study will last approximately 60 minutes and will include one visit to the study center.",
                "Participation in this study may include all or some of the following surveys:",
                "During the study tasks you may be video and audio recorded. You will be asked to wear one or more devices that measure several things about you and the space around you.",
                "Your decision to participate in this study is voluntary.  You may choose to not participate or you may withdraw from the study for any reason without penalty or loss of benefits to which you are otherwise entitled and without any effect on your future relationship with Pfizer."
            ],
            details: [
                "Before agreeing to participate in this research study, it is important that you read and understand the following explanation of the study. This consent document describes the purpose, procedures and risks of the study.  It also describes your right to withdraw from the study at any time. No guarantees or assurances can be made as to the results of the study.\n\nThere is a need to learn more about the use of health sensors in clinical practice. For this reason, Pfizer is conducting an observational study to collect information on the ability of these sensors and the way that we look at the information that the sensors detect to learn about the person wearing the sensor. In addition to the use of health sensors, there has also been an increase in the use of digital means to administer cognitive tasks. Pfizer will be investigating how similar the scores are between these two different administering techniques. \n\nYou are being asked to participate in this research study because you are generally healthy and between the ages of 18 and 65. This study is for research purposes only.  There is no direct benefit to you from your participation in the study.  Information learned from the study may help other people in the future. The goals of this study are: \n - To compare data from various devices while performing in lab tasks such as talking, walking, and activities of daily living like drinking from a cup. \n - To compare the scores from paper and digital cognitive tasks. \n - To evaluate wearability and comfort of these devices. \n - To build a registry of data and healthy volunteers who may want to participate in future studies \n\n The study will take place at the Pfizer Innovative Research (Pfire) lab located at 610 North Main Street, Cambridge, MA. The Principal Investigator of the study is Xuemei Cai M.D. and can be contacted at 617.417.2389.",
                "NON-COERCION STATEMENT \n\n As an employee of the study sponsor, you are under no obligation to participate in this study. You may withdraw from the study at any time for any reason. Your decision to participate in or withdraw from the study will not have any effect whatsoever on your performance appraisal or employment status at the study sponsor. You may refuse to participate or may withdraw from the study at any time without penalty or prejudice",
                "The investigator, Pfizer, or people working on behalf of Pfizer, and under certain circumstances, the United States Food and Drug Administration (FDA), and the Institutional Review Board (IRB) will be able to inspect and copy confidential study-related records which identify you by name. Therefore, absolute confidentiality cannot be guaranteed. \n\n If the results of this study are published or presented at meetings, you will not be identified. Clinical data will be stored securely in a research database. De-identified sensor data will be stored in a secure database and made accessible only to study personnel and qualified individuals doing work on behalf of the study team, and other qualified researchers with whom we may share these de-identified data. In those experimental settings where the subjects will be video and audio recorded, identifiable source video and audio data will be stored on a secure database made accessible only to study personnel and qualified individuals doing work on behalf of the study team and will be kept up to 36 months after the end of the study. Only approved study team members can participate in the experiment and have access to identifiable data. De-identified data will be held in perpetuity. We will not make any attempt to connect data back to you and will not do any clinical analysis of these data. Incidental observations will not be followed up on. \n\n Questions: \n If you have questions related to your rights as a research subject, please write to Schulman IRB 4445 Lake Forest Drive – Suite 300, Cincinnati, Ohio 45242, or call toll free 1-888-557-2472 during business hours Monday – Friday 8:00 a.m. to 6:00 p.m. EST. An institutional review board (IRB) is an independent committee established to help protect the rights of research subjects. \n\n AUTHORIZATION TO USE AND DISCLOSE PROTECTED HEALTH INFORMATION \n\n During your participation in this research study, the investigator and study staff will collect or create personal health information about you (for example, the results of any tests, examinations or procedures you undergo while in the study) and record it on study documents.  The investigator will keep this personal health information in your study-related records (that we will refer to as 'your study records'). Your study records may include other personal information (such as results of the study procedures, which could be used to identify you.  Health information that could identify you is called 'Protected Health Information' (or 'PHI'). Under federal law (the 'Privacy Rule'), your PHI that is created or obtained during this research study cannot be 'used' to conduct the research or 'disclosed' (given to anyone) for research purposes without your permission.  This permission is called an 'Authorization.'  Therefore, you may not participate in this study unless you give your permission to use and disclose your PHI by signing this Authorization.  By signing, you are agreeing to allow the investigator and study staff to use your PHI to conduct this study. By signing this Authorization, you also are agreeing to allow the investigator to disclose PHI as follows: \n - To Pfizer and anyone working on behalf of Pfizer to conduct this study. Pfizer will analyze and evaluate the PHI and may use it to develop new tests, procedures and commercial products.  The study staff will assign a code number and/or letters to your records, which means that you will not ordinarily be identified in the records.  Pfizer may, however, look at your complete study records that identify you. In addition, Pfizer may visit the study site to oversee the way the study is being conducted and may review your PHI during these visits to make sure the information is correct. \n - The Institutional Review Board ('IRB') may have access to your PHI in relation to its responsibilities as an Institutional Review Board. \n - The investigator or Pfizer may disclose your PHI to the United States Food and Drug Administration ('FDA') or similar regulatory agencies in the United States and/or foreign countries. \n These disclosures also help ensure that the information related to the research is available to all parties who may need it for research purposes. \n\n Except for the disclosures described above, your PHI will not be shared with others unless required by law.  If your PHI is given to the parties listed above and/or to others who are not required to comply with the federal law, your PHI will no longer be protected by this law and could possibly be used or disclosed in ways other than those listed here. You have a right to see and make copies of your PHI.  You are agreeing, however, by signing this document, not to see or copy your PHI until Pfizer has completed all work related to this study.  At that time, you may ask to see your records. \n\n This Authorization will expire 50 years from the date you sign it unless you revoke (cancel or withdraw) it sooner.  You have a right to revoke your Authorization at any time.  If you revoke it, your PHI will no longer be used for this study, except to the extent that the parties to the research have already taken action based upon your Authorization, or need the information to complete analysis and reports for this research.  To revoke your Authorization, you must write to the investigator, stating that you are revoking your Authorization to Use and Disclose Protected Health Information.  If you revoke this Authorization, you will not be allowed to continue to be in this study. You will receive a copy of this Authorization after you have signed it.",
                "Data collected from you for this study will be in password protected computers and stored locally on a dedicated machine and in password protected software that allow only the site team to have access. De-identified data without your name and/or birthdate may be shared with other investigators to allow for data analysis. Examples of other investigators may include academic, government or industry researchers, public-private partnerships, and/or external research collaborations. These entities will have oversight committees that will supervise the ethical use of the data and samples. At no time will the data or samples be allowed to be sold by an individual or group for profit. During your participation in the study, we will give you a personal subject code. This code will be linked to your unidentifiable subject ID. If you come back to participate in other studies you will have the option of presenting us with this code. \n\n All data will be coded. The code will not contain any personally-identifiable information. The password key to the code will be kept separately from the samples. Electronic data will be kept in password-protected electronic and mobile devices (i.e. laptops, tablets, and smart phones, and smart watches). Paper data and videotapes will be kept in locked cabinets in rooms that are locked when not occupied. Once data are collected, results analyzed and papers published, the video and audio files will be retained for further analysis, training, and/or teaching purposes, however your face will be blurred to ensure the video files are de-identified for long term storage.  Only the site team will have immediate access to video and audio files, as well as electronic and paper data. Because part of this study depends on your wearing a mobile device or carrying a mobile device with you, the companies or services that operate the data systems, data platforms, and other systems supporting those devices will also obtain your de-identified experimental data generated by or with those devices, and those companies or services will share those data with the research assistants.",
                "Between 50 and 400 subjects will participate in this study.  Your participation in this study will last approximately 60 minutes and will include one visit to the study center.  For your time and inconvenience related to your participation in this study, you will receive a $25 gift card if you complete this study.",
                "Participation in this study may include all or some of the following surveys: \n - Device literacy questionnaire \n - Device equipment questionnaire \n - Device wearability and comfort questionnaire",
                "Before any study-related tests and procedures are performed, you are being asked to read and sign this consent document. The following procedures will be performed to determine if you qualify for the study: \n - Completion of a series of questions to ensure you are qualified to participate in the research. \n\n During the study tasks you may be video and audio recorded. You will be asked to wear one or more devices that measure several things about you and the space around you. Only marketed devices will be used in this study. You will not feel the device take these measurements. These measurements may include some or all of the following: 1) your heart rate, 2) your skin temperature, 3) your physical activity, 4) sweating measurement, blood pressure, oxygen in your blood, electrocardiogram (heart tracing), 5) the altitude of where you are, 6) the surrounding temperature and humidity, 7) air pressure, 8) the amount of light around you, and 9) time the device is worn on the wrist, 10) sounds your chest is making such as coughing. \n\n Participation in the study may consist of some or all of the following tasks: \n - A questionnaire to determine which of your hands is dominant \n - Tasks using a phone or tablet as well as on paper which measure things like your memory, reasoning, and attention. \n - Trying out different device equipment \n - Walking and turning \n - Standing up and sitting down \n - Standing with your eyes opened \n - Activities of daily living such as drinking from a cup, writing a sentence, buttoning a lab coat, or tying shoe laces \n\n Risks and side effects of study tasks include: \n - Safety first: if the device makes you uncomfortable or if you have any issues or questions regarding the use or safety of the device, stop using it immediately and inform a member of the study team \n - A skin irritation is rare but could occur while wearing some of the devices \n - One of the devices contains a magnet so it should not be used by people with a cardiac pacemaker or implantable defibrillator, or placed near the site where such a device is placed under the skin \n - There are non-physical risks associated with taking part in this study such as risk of accidental disclosure of your personally identifiable medical information \n\n Tell the study doctor listed on page 1 of this document if you think being a subject in this study has caused you to be harmed. \n\n Signing this form does not take away any of your legal rights. You still have rights as a participant of a research study.",
                "If you withdraw, at the time of withdrawal your data that has been integrated into larger data sets will be retained. We will give you the choice of having your identifiable data deleted or permitting us to keep it as described above. \n\n The investigator or Pfizer can stop your participation at any time without your consent for the following reasons: \n - If you fail to follow directions for participating in the study; \n - If it is discovered that you do not meet the study requirements; \n - If the study is canceled; or \n  - For administrative reasons, including the target number of subjects having entered the study. \n If you leave the study for any reason, the investigator may ask you some questions about your reason for leaving. \n\n COMPENSATION FOR INJURY \n\n A research injury is any physical injury or illness caused by your participation in the study.  If you are injured by a medical treatment or procedure that you would have received even if you were not in the study that is not a research injury. If you experience a research injury, the study investigator will provide or arrange for medical treatment at no costs to you. Pfizer will cover the costs of this treatment. Payment for such things such as lost wages, expenses other than medical care, or pain and suffering is not available. To help avoid injury it is very important to follow all study directions. You are not giving up any legal rights by signing this document."
            ]
        ),
        //Declare study 1
        //static let Study2 = Study(
        Study(
            ID: 1,
            Number: "StudyNumber2",
            Name: "StudyNamex2",
            PIFirstName: "xxPIFirstNamex2",
            PILastName: "x2PILastNamex2",
            PIsigImage: #imageLiteral(resourceName: "Pfizer_logo"),
            PIsigDate: "10/10/2010",
            SigConsentText: "I have read and understand the information in this informed consent document.  I have had an opportunity to ask questions, and all of my questions have been answered to my satisfaction. I voluntarily agree to participate in this study until I decide otherwise.  I do not give up any of my legal rights by signing this consent document.  I will receive a copy of this signed consent document.",
            consentSectionTypes: [
                .overview,
                .dataGathering,
                .privacy,
                .dataUse,
                .timeCommitment,
                .studySurvey,
                .studyTasks,
                .withdrawing
            ],
            summaries: [
                "x2SummaryText1x2",
                "x2SummaryText2x2",
                "x2SummaryText3x2",
                "x2SummaryText4x2",
                "x2SummaryText5x2",
                "x2SummaryText6x2",
                "x2SummaryText7x2",
                "x2SummaryText8x2"
            ],
            details: [
                "x2DetailText1x2",
                "x2DetailText2x2",
                "x2DetailText3x2",
                "x2DetailText4x2",
                "x2DetailText5x2",
                "x2DetailText6x2",
                "x2DetailText7x2",
                "x2DetailText8x2"
            ]
        )
    ]
}

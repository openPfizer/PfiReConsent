# PfiReConsent
Lightweight, in person, eConsent for clinical research written in Swift and using ResearchKit and the BoxSDK.

**Required dependencies**: ResearchKit, box-ios-sdk

## Function
Operator is presented with a screen that references Box sign in via the SDK. Once signed in, checks against folder access for write access to the specified folder ID. If appropriate access, checks for outbound iMessage capability. Appropriate consent for the study is selected. Presents consent as a series of screens and subscreens. Subject adds name and signature. Entire consent is packaged as a PDF and uploaded to box folder. A sharing link is created to the box document and that link is inserted into an iMessage message, which can be sent to the subject. 

## Questions or Issues
daniel.karlin@pfizer.com, or open a GitHub issue

---
Credit to: 

The official ResearchKit documentation: http://researchkit.org/docs/docs/InformedConsent/InformedConsent.html

Ray Wendrlich's Tutoriak that really got this project kicked off: https://www.raywenderlich.com/104575/researchkit-tutorial-with-swift

The maintainers of the box-ios-sdk repository https://github.com/box/box-ios-sdk

Folks who have asked questions and given great answers at StackOverfow on ResearchKit https://stackoverflow.com/questions/tagged/researchkit and Swift https://stackoverflow.com/questions/tagged/swift

![](/Assets.xcassets/AppIcon.appiconset/Icon-App-40x40@3x.png)
![](osbypfizer.png)

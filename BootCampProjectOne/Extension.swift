//
//  Untitled.swift
//  BootCampProjectOne
//
//  Created by Arpit 24 on 01/07/26.
//

import Foundation
import UIKit
// swiftlint:disable line_length
extension UIColor {
    convenience init?(hexString: String) {
        var chars = Array(hexString.hasPrefix("#") ? hexString.dropFirst() : hexString[...])
        let red, green, blue, alpha: CGFloat
        switch chars.count {
        case 3:
            chars = chars.flatMap { [$0, $0] }
            fallthrough
        case 6:
            chars = ["F", "F"] + chars
            fallthrough
        case 8:
            alpha = CGFloat(strtoul(String(chars[0...1]), nil, 16)) / 255
            red   = CGFloat(strtoul(String(chars[2...3]), nil, 16)) / 255
            green = CGFloat(strtoul(String(chars[4...5]), nil, 16)) / 255
            blue  = CGFloat(strtoul(String(chars[6...7]), nil, 16)) / 255
        default:
            return nil
        }
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
extension UITextView {
    func setHTMLFromString(htmlText: String) {
        let modifiedFont = String(format:"<span style=\"font-family: '-apple-system', 'OpenSans-SemiBold'; font-size: \(14)\">%@</span>", htmlText)
        
        let attrStr = try! NSAttributedString(
            data: modifiedFont.data(using: .unicode, allowLossyConversion: true)!,
            options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue],
            documentAttributes: nil)
        
        self.attributedText = attrStr
    }
    
}
//extension UILabel {
//    func selectedLabel() {
//        self.textColor = UIColor(hexString: logInBlue)
//    }
//    func deselectedLabel() {
//        self.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
//    }
////    func underline() {
////        guard let text = self.text else { return }
////        let attributedString = NSMutableAttributedString(string: text)
////        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: text.count))
////        self.attributedText = attributedString
////    }
//}
//

extension UIView {
    
        func viewSelected() {
            self.layer.backgroundColor = #colorLiteral(red: 0.9254901961, green: 0.9568627451, blue: 1, alpha: 1)
            self.layer.borderColor = #colorLiteral(red: 0.6392156863, green: 0.7921568627, blue: 1, alpha: 1)
            self.layer.borderWidth = 1
        }
        
        func viewUnselected() {
            self.backgroundColor = UIColor.clear
            self.layer.borderColor = #colorLiteral(red: 0.6941176471, green: 0.7098039216, blue: 0.7333333333, alpha: 1)
            self.layer.borderWidth = 1
        }
    
    func selectedCell() {
        self.backgroundColor = #colorLiteral(red: 0.9398769736, green: 0.9663442969, blue: 1, alpha: 1) // Light blue
        self.layer.borderColor = #colorLiteral(red: 0.6392156863, green: 0.7921568627, blue: 1, alpha: 1)
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 5
    }
    func deSelectedCell() {
        self.backgroundColor = .white // white
        self.layer.borderColor = #colorLiteral(red: 0.8980392157, green: 0.9019607843, blue: 0.9098039216, alpha: 1)
        self.layer.cornerRadius = 5
    }
}
// MARK: Padding
extension UITextField {
    func setLeftPaddingPoints(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
extension UIViewController {
    
    func createAlertOkCallback (title:String, message:String,completionBlock:@escaping (_ okPressed:Bool)->())
    {
        let alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: { (alert) in
            completionBlock(true)
        })
        
        
        alertView.addAction(action)
        self.present(alertView, animated: true, completion: nil)
    }
    func convertHtmlToAttributedString(htmlString: String) -> NSAttributedString? {
        do {
            let data = htmlString.data(using: .utf8, allowLossyConversion: true)
            let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
                .documentType: NSAttributedString.DocumentType.html,
                .characterEncoding: String.Encoding.utf8.rawValue
            ]
            
            let attributedString = try NSAttributedString(data: data!,
                                                          options: options,
                                                          documentAttributes: nil)
            
            return attributedString
        } catch {
            print("Error converting HTML to NSAttributedString: \(error)")
            return nil
        }
    }
    func convertDateFormatForOfferEdit(inputDate: String) -> String {
        if inputDate != "" {
            let olDateFormatter = DateFormatter()
            olDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            let oldDate = olDateFormatter.date(from: inputDate)
            let convertDateFormatter = DateFormatter()
            convertDateFormatter.locale = Locale(identifier: "en")
            convertDateFormatter.dateFormat = "yyyy-MM-dd"
            let date = convertDateFormatter.string(from: oldDate ?? Date())
            return date
        }
        return ""
    }
    func convertDateFormat(inputDate: String) -> String {
        if inputDate != "" {
            let olDateFormatter = DateFormatter()
            olDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            
            let oldDate = olDateFormatter.date(from: inputDate)
            let convertTimeFormatter = DateFormatter()
            let convertDateFormatter = DateFormatter()
            convertDateFormatter.locale = Locale(identifier: "en")
            convertDateFormatter.dateFormat = "ddMMMMYYYY"//"ddMMM, yyyy"
            convertTimeFormatter.dateFormat = "hh:mm a"
            let date = convertDateFormatter.string(from: oldDate ?? Date())
            let time = convertTimeFormatter.string(from: oldDate ?? Date())
            return date + " at " + time
        }
        return ""
    }
    
    func convertDateForOrder(inputDate: String) -> String {
        if inputDate != "" {
            let olDateFormatter = DateFormatter()
            olDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            let oldDate = olDateFormatter.date(from: inputDate)
            let convertDateFormatter = DateFormatter()
            convertDateFormatter.locale = Locale(identifier: "en")
            convertDateFormatter.dateFormat = "ddMMMMYYYY"//"ddMMM, yyyy"
            let date = convertDateFormatter.string(from: oldDate ?? Date())
            return date
        }
        return ""
    }
    func convertDateForReview(inputDate: String) -> String {
        if inputDate != "" {
            let olDateFormatter = DateFormatter()
            olDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            let oldDate = olDateFormatter.date(from: inputDate)
            let convertDateFormatter = DateFormatter()
            convertDateFormatter.locale = Locale(identifier: "en")
            convertDateFormatter.dateFormat = "ddMMMMYYYY"//"dd MMMM yyyy"
            let date = convertDateFormatter.string(from: oldDate ?? Date())
            return date
        }
        return ""
    }
    func convertDateDefault(inputDate: String) -> String {
        if inputDate != "" {
            let olDateFormatter = DateFormatter()
            olDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            
            let oldDate = olDateFormatter.date(from: inputDate)
            let convertDateFormatter = DateFormatter()
            convertDateFormatter.locale = Locale(identifier: "en")
            convertDateFormatter.dateFormat = "ddMMMMYYYY"//"dd/MM/yyyy"
            let date = convertDateFormatter.string(from: oldDate ?? Date())
            return date
        }
        return ""
    }
    func convert24to12hr(inputTime: String) -> String {
        if inputTime != "" {
            let inputFormatter = DateFormatter()
            inputFormatter.dateFormat = "HH:mm"
            let date = inputFormatter.date(from: inputTime)
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = "h:mm a"
            let timeString12hr = outputFormatter.string(from: date ?? Date())
            return timeString12hr
        }
        return ""
    }
    
        func convertTimeForOrder(inputTime: String) -> String {
            if inputTime != "" {
                let olDateFormatter = DateFormatter()
                olDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
                let oldDate = olDateFormatter.date(from: inputTime)
                let convertDateFormatter = DateFormatter()
                convertDateFormatter.locale = Locale(identifier: "en")
                convertDateFormatter.dateFormat = "hh:mm a"
                let time = convertDateFormatter.string(from: oldDate ?? Date())
                return time
            }
            return "N/A"
        }
    func convertUTCToLocalTime(utcTimeString: String, timeZone: String) -> (String, String , String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        
        if let utcDate = dateFormatter.date(from: utcTimeString) {
            dateFormatter.dateFormat = "ddMMMM, yyyy, hh:mm a" //"ddMMMMYYYY, hh:mm a" //
            dateFormatter.timeZone = TimeZone(identifier: timeZone)
            let localTimeString = dateFormatter.string(from: utcDate)
            let components = localTimeString.components(separatedBy: ", ")
            return (components[0], components[1], components[2])
        } else {
            return ("N/A", "", "N/A")
        }
    }
    // convertDate for subscription history
    func SubscriptionHistoryformatDate(_ dateString: String) -> String? {
        let olDateFormatter = DateFormatter()
        olDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        let oldDate = olDateFormatter.date(from: dateString)
        let convertDateFormatter = DateFormatter()
        convertDateFormatter.locale = Locale(identifier: "en")
        convertDateFormatter.dateFormat = "ddMMMMYYYY"//"dd/MM/yyyy"
        let date = convertDateFormatter.string(from: oldDate ?? Date())
        return date
    }
        // get current UTC time
    func getCurrentUTCTimeString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        
        let currentDateTime = Date()
        return dateFormatter.string(from: currentDateTime)

    }
    
//        func logout() {
//            clearUserDefaults()
//            let story = UIStoryboard(name: "Main", bundle:nil)
//            if let vc = story.instantiateViewController(withIdentifier: "LogInViewController") as? LogInViewController {
//                navigationController?.setViewControllers([vc], animated: false)
//            }
//        }
//    
        func popup() {
            self.navigationController?.popViewController(animated: true)
        }
//        func setUpBtn(str: String, btn: UIButton) {
//            btn.setTitle(str, for: .normal)
//            btn.layer.cornerRadius = 10
//            btn.backgroundColor = UIColor(hexString: logInBlue)
//            btn.tintColor = UIColor(hexString: white)
//        }
//        func setUpWhiteBackBtn(str: String, btn: UIButton) {
//            btn.setTitle(str, for: .normal)
//            btn.layer.cornerRadius = 10
//            btn.backgroundColor = UIColor(hexString: white)
//            btn.tintColor = UIColor(hexString: logInBlue)
//            btn.layer.borderWidth = 1
//            btn.layer.borderColor = UIColor(hexString: logInBlue)?.cgColor
//        }
        func underLineText(str: String, btn: UIButton) {
            let attributedString = NSMutableAttributedString(string: str)
            attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: attributedString.length))
            btn.setAttributedTitle(attributedString, for: .normal)
        }
        func setUpTextField(txtFld: UITextField, cornerRadius: CGFloat, borderWidth: CGFloat, borderClr: String, placeHolder: String) {
            txtFld.layer.cornerRadius = cornerRadius
            txtFld.layer.borderWidth = borderWidth
            txtFld.layer.borderColor = UIColor(hexString: borderClr)?.cgColor
            txtFld.placeholder = placeHolder
        }
        func setUpView(view: UIView, borderwdth: CGFloat, bdrclr: String, cnrRds: CGFloat) {
            view.layer.borderWidth = borderwdth
            view.layer.borderColor = UIColor(hexString: bdrclr)?.cgColor
            view.layer.cornerRadius = cnrRds
        }
        func setUpLabel(lblname: UILabel, txt: String, txtClr: String) {
            lblname.text = txt
            lblname.textColor = UIColor(hexString: txtClr)
            lblname.font = UIFont.boldSystemFont(ofSize: 11)
        }
        }
extension UIImage {
    func resized(to newSize: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: newSize))
        return UIGraphicsGetImageFromCurrentImageContext()?.withRenderingMode(renderingMode)
    }
}
extension UINavigationController {
    func popToViewController(ofClass: AnyClass, animated: Bool = true) {
        if let viewContoller = viewControllers.last(where: { $0.isKind(of: ofClass) }) {
            popToViewController(viewContoller, animated: animated)
        }
    }
}
extension UIApplication
{
    class func topViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController?
    {
        if let nav = base as? UINavigationController
        {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController
        {
            if let selected = tab.selectedViewController
            {
                return topViewController(base: selected)
            }
        }
        if let presented = base?.presentedViewController
        {
            return topViewController(base: presented)
        }
        return base
    }
}
extension URL {
    var toString:String? {
        return self.absoluteString
    }
}
extension String{
    func isValidUsernamess(_ fullName: String) -> Bool {
        let name = fullName.count <= 30
        return name
    }

    func isValidUsername(_ fullName : String) ->Bool {
        let RegEx = "^[A-Za-z][ ]{0,1}[A-Za-z ]*$"
        let usernameTest = NSPredicate(format:"SELF MATCHES %@", RegEx)
        let name = usernameTest.evaluate(with: self) && fullName.count <= 30
        return name
    }
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
//    func isValidEmail(_ email : String) ->Bool{
//        let emailRegEx = "[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}"
//        //predicate is works like a filter
//        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
//        let email = emailTest.evaluate(with: self)
//        return  email
//
//    }
    func isValidAddress(_ address : String) -> Bool {
        let RegEx = "[a-zA-Z]+[a-zA-Z[ ][0-9]+-]+"
        let usernameTest = NSPredicate(format:"SELF MATCHES %@", RegEx)
        let address = usernameTest.evaluate(with: self) && address.count <= 40
        return address
    }
   
    func isValidPass(_ password: String) -> Bool {
        let passwordRegex = "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[!@#$%^&*]).{8,}$"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordTest.evaluate(with: password)
    }
    
    
    func isValidDoB(_ dob : String) ->Bool {
        
        return true
    }
    func isValidCity(_ city: String) -> Bool {
        let RegEx = "[A-Za-z ]+"
        let usernameTest = NSPredicate(format:"SELF MATCHES %@", RegEx)
        let city = usernameTest.evaluate(with: self) && city.count <= 20
        return city
    }
    
    var isValidDoB : Bool{
        let dobregEx = "[0-9]+/[0-9]+/[0-9]"
        let dobTest = NSPredicate(format: "SELF MATCHES %@", dobregEx)
        return dobTest.evaluate(with: self)
    }
    var isValidEmail: Bool{
        let emailRegEx = "[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}"
        //predicate is works like a filter
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    var isPasswordValid: Bool{
        let alphanumericPattern = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-zA-Z])(?=.*\\d).+$")
        // let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^[a-zA-Z]{8,}$")
        return alphanumericPattern.evaluate(with: self)
    }
    
    var isValidUsername: Bool {
        let RegEx = "[A-Za-z ]+"
        let usernameTest = NSPredicate(format:"SELF MATCHES %@", RegEx)
        return usernameTest.evaluate(with: self)
    }
    
    var isValidDesignation: Bool {
        let RegEx = "[a-zA-Z[ ]0-9&._-]+"
        let usernameTest = NSPredicate(format:"SELF MATCHES %@", RegEx)
        return usernameTest.evaluate(with: self)
    }
    
    var isValidCompanyName: Bool {
        let RegEx = "[a-zA-Z[ ]0-9&._-]+"
        let usernameTest = NSPredicate(format:"SELF MATCHES %@", RegEx)
        return usernameTest.evaluate(with: self)
    }
    
    var isValidNumber: Bool {
        let RegEx = "[0-9]{6,15}"
        let usernameTest = NSPredicate(format:"SELF MATCHES %@", RegEx)
        return usernameTest.evaluate(with: self)
    }
    func isValidNumberChk(_ number: String) -> Bool {
        let regex = "^[0-9]{6,15}$"
        let numberTest = NSPredicate(format: "SELF MATCHES %@", regex)
        let number = numberTest.evaluate(with: number) && number.count >= 8
        return number
    }
    
    
    var isValidDisease: Bool{
        let RegEx = "^[a-zA-Z][a-zA-Z0-9 ]*$"
        let diseaseTest = NSPredicate(format: "SELF MATCHES %@",RegEx)
        return diseaseTest.evaluate(with: self)
    }
}
public struct ez {
    
    public static func runThisAfterDelay(seconds: Double, after: @escaping () -> Void) {
        runThisAfterDelay(seconds: seconds, queue: DispatchQueue.main, after: after)
    }
    
    //TODO: Make this easier
    /// EZSE: Runs function after x seconds with dispatch_queue, use this syntax: dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0)
    public static func runThisAfterDelay(seconds: Double, queue: DispatchQueue, after: @escaping () -> Void) {
        let time = DispatchTime.now() + Double(Int64(seconds * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        queue.asyncAfter(deadline: time, execute: after)
    }
    
}
class RectangularDashedView: UIView {
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    @IBInspectable var dashWidth: CGFloat = 0
    @IBInspectable var dashColor: UIColor = .black
    @IBInspectable var dashLength: CGFloat = 0
    @IBInspectable var betweenDashesSpace: CGFloat = 0
    
    var dashBorder: CAShapeLayer?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        dashBorder?.removeFromSuperlayer()
        let dashBorder = CAShapeLayer()
        dashBorder.lineWidth = dashWidth
        dashBorder.strokeColor = dashColor.cgColor
        dashBorder.lineDashPattern = [dashLength, betweenDashesSpace] as [NSNumber]
        dashBorder.frame = bounds
        dashBorder.fillColor = nil
        if cornerRadius > 0 {
            dashBorder.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        } else {
            dashBorder.path = UIBezierPath(rect: bounds).cgPath
        }
        layer.addSublayer(dashBorder)
        self.dashBorder = dashBorder
    }
}
extension UIView {
    func roundReceiverChatCorner(cornerRadius : Double){
        self.layer.cornerRadius = CGFloat(cornerRadius)
        self.clipsToBounds = true
        self.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
    func roundsenderChatCorner(cornerRadius : Double){
        self.layer.cornerRadius = CGFloat(cornerRadius)
        self.clipsToBounds = true
        self.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner ,.layerMinXMinYCorner]
        
    }
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 4, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    func displayTooltip(_ message: String, completion: (() -> Void)? = nil) {
        let tooltipBottomPadding: CGFloat = 12
        let tooltipCornerRadius: CGFloat = 6
        let tooltipAlpha: CGFloat = 0.95
        let pointerBaseWidth: CGFloat = 14
        let pointerHeight: CGFloat = 8
        let padding = CGPoint(x: 18, y: 12)
        
        let tooltip = UIView()
        
        let tooltipLabel = UILabel()
        tooltipLabel.text = "    \(message)    "
        tooltipLabel.font = UIFont.systemFont(ofSize: 12)
        tooltipLabel.contentMode = .center
        tooltipLabel.textColor = .white //44 44 44
        tooltipLabel.layer.backgroundColor = UIColor(red: 0 / 255, green: 106 / 255, blue: 249 / 255, alpha: 1).cgColor
        tooltipLabel.layer.cornerRadius = tooltipCornerRadius
        
        tooltip.addSubview(tooltipLabel)
        tooltipLabel.translatesAutoresizingMaskIntoConstraints = false
        tooltipLabel.bottomAnchor.constraint(equalTo: tooltip.bottomAnchor, constant: -pointerHeight).isActive = true
        tooltipLabel.topAnchor.constraint(equalTo: tooltip.topAnchor).isActive = true
        tooltipLabel.leadingAnchor.constraint(equalTo: tooltip.leadingAnchor).isActive = true
        tooltipLabel.trailingAnchor.constraint(equalTo: tooltip.trailingAnchor).isActive = true
        
        let labelHeight = message.height(withWidth: .greatestFiniteMagnitude, font: UIFont.systemFont(ofSize: 12)) + padding.y
        let labelWidth = message.width(withHeight: .zero, font: UIFont.systemFont(ofSize: 12)) + padding.x
        
        let pointerTip = CGPoint(x: labelWidth / 2, y: labelHeight + pointerHeight)
        let pointerBaseLeft = CGPoint(x: labelWidth / 2 - pointerBaseWidth / 2, y: labelHeight)
        let pointerBaseRight = CGPoint(x: labelWidth / 2 + pointerBaseWidth / 2, y: labelHeight)
        
        let pointerPath = UIBezierPath()
        pointerPath.move(to: pointerBaseLeft)
        pointerPath.addLine(to: pointerTip)
        pointerPath.addLine(to: pointerBaseRight)
        pointerPath.close()
        
        let pointer = CAShapeLayer()
        pointer.path = pointerPath.cgPath
        pointer.fillColor = UIColor(red: 44 / 255, green: 44 / 255, blue: 44 / 255, alpha: 1).cgColor
        
        tooltip.layer.addSublayer(pointer)
        (superview ?? self).addSubview(tooltip)
        tooltip.translatesAutoresizingMaskIntoConstraints = false
        tooltip.bottomAnchor.constraint(equalTo: topAnchor, constant: -tooltipBottomPadding + pointerHeight).isActive = true
        tooltip.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        tooltip.heightAnchor.constraint(equalToConstant: labelHeight + pointerHeight).isActive = true
        tooltip.widthAnchor.constraint(equalToConstant: labelWidth).isActive = true
        
        tooltip.alpha = 0
        UIView.animate(withDuration: 0.2, animations: {
            tooltip.alpha = tooltipAlpha
        }, completion: { _ in
            UIView.animate(withDuration: 0.5, delay: 0.5, animations: {
                tooltip.alpha = 0
            }, completion: { _ in
                tooltip.removeFromSuperview()
                completion?()
            })
        })
    }
}
extension String {
    func width(withHeight constrainedHeight: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: constrainedHeight)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
        return ceil(boundingBox.width)
    }
    
    func height(withWidth constrainedWidth: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: constrainedWidth, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
        return ceil(boundingBox.height)
    }
    func trimExcessWhitespace() -> String {
        let trimmed = self.trimmingCharacters(in: .whitespacesAndNewlines)
        let regex = try! NSRegularExpression(pattern: "\\s{2,}", options: .caseInsensitive)
        let range = NSMakeRange(0, trimmed.count)
        let modifiedString = regex.stringByReplacingMatches(in: trimmed, options: [], range: range, withTemplate: " ")
        return modifiedString
    }
}
//struct AppUtility {
//    
//    static func lockOrientation(_ orientation: UIInterfaceOrientationMask) {
//        
//        if let delegate = UIApplication.shared.delegate as? AppDelegate {
//            delegate.orientationLock = orientation
//        }
//    }
//    
//    /// OPTIONAL Added method to adjust lock and rotate to the desired orientation
//    static func lockOrientation(_ orientation: UIInterfaceOrientationMask, andRotateTo rotateOrientation:UIInterfaceOrientation) {
//        
//        self.lockOrientation(orientation)
//        
//        UIDevice.current.setValue(rotateOrientation.rawValue, forKey: "orientation")
//    }
//    
//}
class NoCopyPasteTextField: UITextField {
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(UIResponderStandardEditActions.paste(_:)) ||
           action == #selector(UIResponderStandardEditActions.copy(_:)) || action == #selector(UIResponderStandardEditActions.cut(_:)) {
            return false
        }
        return super.canPerformAction(action, withSender: sender)
    }
}
extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)
        } catch {
            return nil
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}
extension StringProtocol {
    var html2AttributedString: NSAttributedString? {
        Data(utf8).html2AttributedString
    }
    var html2String: String {
        html2AttributedString?.string ?? ""
    }
}
extension Data {
    var html2AttributedString: NSAttributedString? {
        do {
            return try NSAttributedString(data: self, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            print("error:", error)
            return  nil
        }
    }
    var html2String: String { html2AttributedString?.string ?? "" }
}

// swiftlint:enable line_length

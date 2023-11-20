//
//  ToastManager.swift
//  POS
//
//  Created by Jihoon on 2023/11/07.
//

import Foundation
import Foundation
import UIKit

typealias AlertViewCompletionBlock = (_ alertView: UIAlertController?, _ buttonIndex: Int) -> Void

class ToastManager: NSObject {
    
    class func showMessage(_ message: String, duration: CGFloat = 0.95) {
        
        DispatchQueue.main.async{
            ToastWindow.shared.setAlertWindow()
            if let tvc = ToastWindow.shared.toastWindow {
            
                let width_variable:CGFloat = 20
                let toastLabel = UILabel(frame: CGRect(x: width_variable, y: tvc.frame.size.height-190,
                                                       width: tvc.frame.size.width-2*width_variable, height: 60))
                toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.8)
                toastLabel.numberOfLines = 2
                toastLabel.textColor = UIColor.white
                toastLabel.textAlignment = .center
//                toastLabel.font = UIFont(name: AppleSDGothicNeoM00, size: 15.0)
                toastLabel.text = message
                toastLabel.alpha = 1.0
                toastLabel.layer.cornerRadius = 12
                toastLabel.clipsToBounds  =  true
                toastLabel.tag = 100
                tvc.addSubview(toastLabel)
                UIView.animate(withDuration: duration, delay: 0.0, options: .curveEaseIn, animations: {
                    toastLabel.alpha = 0.0
                }, completion: {(isCompleted) in
                    toastLabel.removeFromSuperview()
                    if !ToastWindow.shared.hasAlert {
                        ToastWindow.shared.toastRemove()
                    }
                })
            }
        }
    }
    
    class func showImage(imageName imageName : String,duration duration : CGFloat){
        DispatchQueue.main.async {
            ToastWindow.shared.setAlertWindow()
            if let tvc = ToastWindow.shared.toastWindow {
                
                let width:CGFloat = 218
                let imageView = UIImageView(frame: CGRect(x: tvc.frame.size.width / 2 - width/2, y: tvc.frame.size.height - 200, width: width, height: 87))
                imageView.translatesAutoresizingMaskIntoConstraints = false
                
                
                
                imageView.image = UIImage(named: imageName)
                imageView.contentMode = .scaleAspectFill
                tvc.addSubview(imageView)
                UIView.animate(withDuration: duration, delay: 0.0, options: .curveEaseIn, animations: {
                    imageView.alpha = 0.0
                }, completion: {(isCompleted) in
                    imageView.removeFromSuperview()
                    if !ToastWindow.shared.hasAlert {
                        ToastWindow.shared.toastRemove()
                    }
                })
                
            }
        }
    }
}

class ToastWindow {
    
    static let shared = ToastWindow()
    
    var toastWindow: UIWindow?
    
    var hasAlert: Bool {
        return (toastWindow?.subviews.filter{$0.tag == 100}.count ?? 0) > 0
    }
    
    // MARK: - Alert Window
    func setAlertWindow() {
        guard self.toastWindow == nil else { return }
        if #available(iOS 13, *) {
            if let windowScene = (UIApplication.shared.connectedScenes.filter{ $0.activationState == .foregroundActive }.first) as? UIWindowScene {
                self.toastWindow = UIWindow(windowScene: windowScene)
            }
        } else {
            self.toastWindow = UIWindow(frame: UIScreen.main.bounds)
        }
        self.toastWindow?.isUserInteractionEnabled = false
        self.toastWindow?.windowLevel = UIWindow.Level.normal
        self.toastWindow?.backgroundColor = UIColor.clear
        self.toastWindow?.makeKeyAndVisible()
    }
    
    func toastRemove() {
        if(self.toastWindow != nil){
            self.toastWindow?.rootViewController = nil
            self.toastWindow = nil
        }
    }
}

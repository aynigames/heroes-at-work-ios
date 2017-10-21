// The MIT License (MIT)
//
// Copyright (c) 2015-2016 litt1e-p ( https://github.com/litt1e-p )
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import UIKit
import Foundation

public enum WindowRootVcTransitionStyle: UInt
{
    case None,
         ZoomOut,
         ZoomIn,
         Dissolve,
         SliceVertical,
         SliceHorizontal,
         FlipFromLeft,
         FlipFromRight,
         FlipFromTop,
         FlipFromBottom,
         CurlUp,
         CurlDown,
         Random
}

public extension UIWindow
{
    public func transitRootVc(rootVc: UIViewController, style: WindowRootVcTransitionStyle?, duration: TimeInterval?) {
        var finalStyle: WindowRootVcTransitionStyle = style != nil ? style! : .Random
        if finalStyle == .Random {
            var randomInt: UInt = 0
            arc4random_buf(&randomInt, 11)
            finalStyle = WindowRootVcTransitionStyle(rawValue: UInt(randomInt % 11))!
        }
        transitAnimation(toVc: rootVc, style: finalStyle, duration: duration)
    }
    
    public func transitRootVc(identifier: String, style: WindowRootVcTransitionStyle?, duration: TimeInterval?) {
        var finalStyle: WindowRootVcTransitionStyle = style != nil ? style! : .Random
        if finalStyle == .Random {
            var randomInt: UInt = 0
            arc4random_buf(&randomInt, 11)
            finalStyle = WindowRootVcTransitionStyle(rawValue: UInt(randomInt % 11))!
        }
        if let rootVc = rootViewController?.storyboard?.instantiateViewController(withIdentifier: identifier) {
            transitAnimation(toVc: rootVc, style: finalStyle, duration: duration)
        } else {
            fatalError("Instantiate viewController failed")
        }
    }
    
    private func transitAnimation(toVc: UIViewController, style: WindowRootVcTransitionStyle, duration: TimeInterval?) {
        let durationMin: TimeInterval = duration != nil ? duration! : 0.25
        let durationMax: TimeInterval = duration != nil ? duration! : 0.50
        switch style {
        case .ZoomOut:
            let snapshot:UIView = snapshotView(afterScreenUpdates: true)!
            toVc.view.addSubview(snapshot)
            rootViewController = toVc
            UIView.animate(withDuration: durationMin, animations: {() in
                snapshot.layer.opacity = 0.00
                snapshot.layer.transform = CATransform3DMakeScale(1.50, 1.50, 1.50)
                }, completion: {
                    (value: Bool) in
                    snapshot.removeFromSuperview()
            })
        case .ZoomIn:
            let snapshot:UIView = snapshotView(afterScreenUpdates: true)!
            toVc.view.addSubview(snapshot)
            rootViewController = toVc
            UIView.animate(withDuration: durationMax, animations: {() in
                snapshot.layer.opacity = 0.00
                snapshot.layer.transform = CATransform3DMakeScale(0.01, 0.01, 1.00)
                }, completion: {
                    (value: Bool) in
                    snapshot.removeFromSuperview()
            })
        case .Dissolve:
            let snapshot:UIView = snapshotView(afterScreenUpdates: true)!
            toVc.view.addSubview(snapshot)
            rootViewController = toVc
            UIView.animate(withDuration: durationMin, animations: {
                snapshot.layer.opacity = 0.00
                }, completion: { (value: Bool) in
                    snapshot.removeFromSuperview()
            })
        case .SliceVertical:
            let halfH        = toVc.view.frame.size.height * 0.50
            let aboveRect    = CGRect(x: 0, y: 0, width: toVc.view.frame.size.width, height: halfH)
            let belowRect    = CGRect(x: 0, y: halfH, width: toVc.view.frame.size.width, height: halfH)
            let aboveImgView = UIImageView(image: clipImage(view: self, rect: aboveRect))
            let belowImgView = UIImageView(image: clipImage(view: self, rect: belowRect))
            toVc.view.addSubview(aboveImgView)
            toVc.view.addSubview(belowImgView)
            rootViewController   = toVc
            toVc.view.layer.transform = CATransform3DMakeScale(0.98, 0.98, 1.00)
            UIView.animate(withDuration: durationMax, animations: {
                aboveImgView.layer.transform = CATransform3DMakeTranslation(0.00, -halfH, 0.00)
                belowImgView.layer.transform = CATransform3DMakeTranslation(0.00, halfH, 0.00)
                toVc.view.layer.transform    = CATransform3DIdentity
                }, completion: { (value: Bool) in
                    aboveImgView.removeFromSuperview()
                    belowImgView.removeFromSuperview()
            })
        case .SliceHorizontal:
            let halfW        = toVc.view.frame.size.width * 0.50
            let wholeH       = toVc.view.frame.size.height
            let leftRect     = CGRect(x: 0, y: 0, width: halfW, height: wholeH)
            let rightRect    = CGRect(x: halfW, y: 0, width: halfW, height: wholeH)
            let leftImgView  = UIImageView(image: clipImage(view: self, rect: leftRect))
            let rightImgView = UIImageView(image: clipImage(view: self, rect: rightRect))
            toVc.view.addSubview(leftImgView)
            toVc.view.addSubview(rightImgView)
            rootViewController   = toVc
            toVc.view.layer.transform = CATransform3DMakeScale(0.98, 0.98, 1.00)
            UIView.animate(withDuration: durationMax, animations: {
                leftImgView.layer.transform = CATransform3DMakeTranslation(-halfW, 0.00, 0.00)
                rightImgView.layer.transform = CATransform3DMakeTranslation(halfW * 2.00, 0.00, 0.00)
                toVc.view.layer.transform = CATransform3DIdentity
                }, completion: { (value: Bool) in
                    leftImgView.removeFromSuperview()
                    rightImgView.removeFromSuperview()
            })
        case .FlipFromLeft:
            UIView.transition(with: self, duration: durationMin, options: UIViewAnimationOptions.transitionFlipFromLeft, animations: {
                [weak self] in
                self!.rootViewController = toVc
                }, completion: nil)
        case .FlipFromRight:
            UIView.transition(with: self, duration: durationMin, options: UIViewAnimationOptions.transitionFlipFromRight, animations: {
                [weak self] in
                self!.rootViewController = toVc
                }, completion: nil)
        case .CurlUp:
            UIView.transition(with: self, duration: durationMin, options: UIViewAnimationOptions.transitionCurlUp, animations: {
                [weak self] in
                self!.rootViewController = toVc
                }, completion: nil)
        case .CurlDown:
            UIView.transition(with: self, duration: durationMin, options: UIViewAnimationOptions.transitionCurlDown, animations: {
                [weak self] in
                self!.rootViewController = toVc
                }, completion: nil)
        case .FlipFromTop:
            UIView.transition(with: self, duration: durationMin, options: UIViewAnimationOptions.transitionFlipFromTop, animations: {
                [weak self] in
                self!.rootViewController = toVc
                }, completion: nil)
        case .FlipFromBottom:
            UIView.transition(with: self, duration: durationMin, options: UIViewAnimationOptions.transitionFlipFromBottom, animations: {
                [weak self] in
                self!.rootViewController = toVc
                }, completion: nil)
        default:
            rootViewController = toVc
            break
        }
    }
    
    private func clipImage(view: UIView, rect: CGRect) -> UIImage {
        UIGraphicsBeginImageContext(view.frame.size)
        let context = UIGraphicsGetCurrentContext()
        context!.saveGState()
        UIRectClip(rect)
        view.layer.render(in: context!)
        let output = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return output!
    }
}

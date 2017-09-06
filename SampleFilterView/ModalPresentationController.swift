//
//  ModalPresentationController.swift
//  SampleFilterView
//
//  Created by Sosuke Hirayama on 2017/09/06.
//  Copyright © 2017年 Sosuke Hirayama. All rights reserved.
//

import UIKit

// see alse: http://dev.classmethod.jp/references/ios8-uipresentationcontroller/
class ModalPresentationController: UIPresentationController {

    var overlay: UIView!
    
    override func presentationTransitionWillBegin() {
        let containerView = self.containerView!
        
        self.overlay = UIView(frame: containerView.bounds)
        self.overlay.gestureRecognizers = [UITapGestureRecognizer(target: self, action: #selector(ModalPresentationController.overlayDidTouch(_:)))]
        self.overlay.backgroundColor = UIColor.black
        self.overlay.alpha = 0.0
        containerView.insertSubview(self.overlay, at: 0)
        
        presentedViewController.transitionCoordinator?.animate(alongsideTransition: {
            [unowned self] context in
            self.overlay.alpha = 0.5
            }, completion: nil)
    }
    
    override func dismissalTransitionWillBegin() {
        self.presentedViewController.transitionCoordinator?.animate(alongsideTransition: {
            [unowned self] context in
            self.overlay.alpha = 0.0
            }, completion: nil)
    }
    
    override func dismissalTransitionDidEnd(_ completed: Bool) {
        if completed {
            self.overlay.removeFromSuperview()
        }
    }
    
    override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        return CGSize(width: parentSize.width, height: parentSize.height / 1.5)
    }
    
    override var frameOfPresentedViewInContainerView : CGRect {
        var presentedViewFrame = CGRect.zero
        let containerBounds = containerView!.bounds
        presentedViewFrame.size = self.size(forChildContentContainer: self.presentedViewController, withParentContainerSize: containerBounds.size)
        presentedViewFrame.origin.x = containerBounds.size.width - presentedViewFrame.size.width
        presentedViewFrame.origin.y = containerBounds.size.height - presentedViewFrame.size.height
        return presentedViewFrame
    }
    
    override func containerViewWillLayoutSubviews() {
        overlay.frame = containerView!.bounds
        self.presentedView!.frame = self.frameOfPresentedViewInContainerView
    }
    
    override func containerViewDidLayoutSubviews() {
    }
    
    func overlayDidTouch(_ sender: AnyObject) {
        self.presentedViewController.dismiss(animated: true, completion: nil)
    }
}

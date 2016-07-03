//
//  Button.swift
//  Enum Based Styling
//
//  Created by Tobias Scholze on 02.07.16.
//  Copyright © 2016 Tobias Scholze. All rights reserved.
//

import Foundation
import UIKit


@IBDesignable
public class Button: UIButton
{
    /// MARK: - Properties -
    
    /// Style identifier
    /// Default value = MyStyle
    @IBInspectable
    public var styleIdentifier: String = "MyStyle"
    {
        didSet
        {
            applyNormalStyle(styleIdentifier)
        }
    }
    
    
    override public var enabled: Bool
    {
        didSet
        {
            if enabled
            {
                applyNormalStyle(styleIdentifier)
            }
                
                
            else
            {
                applyDisabledStyle(styleIdentifier)
            }
        }
    }
    
    
    // MARK: - Initialization & Setup -
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        setup()
    }
    
    
    required public init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    
    override public func awakeFromNib()
    {
        super.awakeFromNib()
        setup()
    }
    
    
    override public func beginTrackingWithTouch(touch: UITouch, withEvent event: UIEvent?) -> Bool
    {
        let touched = super.beginTrackingWithTouch(touch, withEvent: event)
        
        if touched
        {
            applyPressedStyle(styleIdentifier)
        }
        
        return touched
    }
    
    
    override public func endTrackingWithTouch(touch: UITouch?, withEvent event: UIEvent?)
    {
        applyNormalStyle(styleIdentifier)
        return super.endTrackingWithTouch(touch, withEvent: event)
    }
    
    
    override public func prepareForInterfaceBuilder()
    {
        setup()
    }
    
    
    // MARK: - Helper
    
    /// Sets deafult but additional styling / shadow properties of the view
    private func setup()
    {
        // Apply generic styling
        setTitleColor(UIColor.whiteColor(), forState: .Normal)
        setTitleColor(UIColor.whiteColor(), forState: .Selected)
        contentEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10)
        
        // Apply style
        applyNormalStyle(styleIdentifier)
    }
    
    
    /// Applies variants of normal styles to the button
    ///
    /// - parameter styleIdentifier: Defines the requested style
    private func applyNormalStyle(styleIdentifier: String)
    {
        switch styleIdentifier
        {
        case ButtonStyle.MyStyle.rawValue:
            backgroundColor = UIColor.grayColor()
            
        default:
            return
        }
    }
    
    
    /// Applies variants of pressed styles to the button
    ///
    /// - parameter styleIdentifier: Defines the requested style
    private func applyPressedStyle(styleIdentifier: String)
    {
        switch styleIdentifier
        {
        case ButtonStyle.MyStyle.rawValue:
            backgroundColor = UIColor.darkGrayColor()

        default:
            return
        }
    }
    
    
    /// Applies variants of disabled styles to the button
    ///
    /// - parameter styleIdentifier: Defines the requested style
    private func applyDisabledStyle(styleIdentifier: String)
    {
        switch styleIdentifier
        {
        case ButtonStyle.MyStyle.rawValue:
            backgroundColor = UIColor.lightGrayColor()
            
        default:
            return
        }
    }
}


/// Defines diffrent button styles
public enum ButtonStyle: String
{
    // Default styling (MyStyle)
    case MyStyle = "MyStyle"
    
    // other styles ...
}
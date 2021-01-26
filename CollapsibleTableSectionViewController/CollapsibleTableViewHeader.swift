//
//  CollapsibleTableViewHeader.swift
//  CollapsibleTableSectionViewController
//
//  Created by Yong Su on 7/20/17.
//  Copyright © 2017 jeantimex. All rights reserved.
//

import UIKit

protocol CollapsibleTableViewHeaderDelegate {
    func toggleSection(_ section: Int)
}

open class CollapsibleTableViewHeader: UITableViewHeaderFooterView {
    
    fileprivate var isCollapsed: Bool = false
    fileprivate var arrowXConstraint: NSLayoutConstraint!
    
    var alignment: NSTextAlignment = .left {
        didSet {
            self.changeAlignment(alignment: self.alignment)
        }
    }
    
    var delegate: CollapsibleTableViewHeaderDelegate?
    var section: Int = 0
    
    let titleLabel = UILabel()
    let arrowImageView = UIImageView()
    
    override public init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        // Content View
        contentView.backgroundColor = UIColor(hex: 0x2E3944)
        
        let marginGuide = contentView.layoutMarginsGuide
        
        // Arrow label
        contentView.addSubview(arrowImageView)
        arrowImageView.contentMode = .scaleAspectFit
        arrowImageView.translatesAutoresizingMaskIntoConstraints = false
        arrowImageView.widthAnchor.constraint(equalToConstant: 8).isActive = true
        arrowImageView.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        self.arrowXConstraint = arrowImageView.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor)
        self.arrowXConstraint.isActive = true
        arrowImageView.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
        
        // Title label
        contentView.addSubview(titleLabel)
        titleLabel.textColor = UIColor.white
        titleLabel.textAlignment = .left
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        
        //
        // Call tapHeader when tapping on this header
        //
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(CollapsibleTableViewHeader.tapHeader(_:))))
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func changeAlignment(alignment: NSTextAlignment) {
        let marginGuide = contentView.layoutMarginsGuide
        self.arrowXConstraint.isActive = false
        if alignment == .right {
            self.arrowXConstraint = arrowImageView.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor)
        } else {
            self.arrowXConstraint = arrowImageView.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor)
        }
        self.arrowXConstraint.isActive = true
        self.titleLabel.textAlignment = alignment
    }
    
    //
    // Trigger toggle section when tapping on the header
    //
    @objc func tapHeader(_ gestureRecognizer: UITapGestureRecognizer) {
        guard let cell = gestureRecognizer.view as? CollapsibleTableViewHeader else {
            return
        }
        
        _ = delegate?.toggleSection(cell.section)
        UIView.animate(withDuration: 0.2) {
            if self.isCollapsed == false {
                self.arrowImageView.transform = .identity
            } else {
                self.arrowImageView.transform = .init(rotationAngle: .pi / 2)
            }
        }
    }
    
    func setCollapsed(_ collapsed: Bool) {
        //
        // Animate the arrow rotation (see Extensions.swf)
        //
        self.isCollapsed = collapsed
        arrowImageView.rotate(collapsed ? 0.0 : .pi / 2)
    }
    
}

extension UIColor {
    
    convenience init(hex:Int, alpha:CGFloat = 1.0) {
        self.init(
            red:   CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8)  / 255.0,
            blue:  CGFloat((hex & 0x0000FF) >> 0)  / 255.0,
            alpha: alpha
        )
    }
    
}

extension UIView {
    
    func rotate(_ toValue: CGFloat, duration: CFTimeInterval = 0.2) {
        self.transform = .init(rotationAngle: toValue)
    }
}



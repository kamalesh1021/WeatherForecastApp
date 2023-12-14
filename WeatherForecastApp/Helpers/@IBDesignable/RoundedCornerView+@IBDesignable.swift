//
//  RoundedCornerView+@IBDesignable.swift
//  WeatherForecastApp
//
//  Created by Empulse on 14/12/23.
//

import UIKit

@IBDesignable
class RoundedCornerView: UIView {

    @IBInspectable var cornerRadius: CGFloat = 10.0 {
        didSet {
            updateUI()
        }
    }

    @IBInspectable var borderWidth: CGFloat = 1.0 {
        didSet {
            updateUI()
        }
    }

    @IBInspectable var borderColor: UIColor = UIColor.black {
        didSet {
            updateUI()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    private func setup() {
        updateUI()
    }

    private func updateUI() {
        layer.cornerRadius = cornerRadius
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
        layer.masksToBounds = cornerRadius > 0
    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
    }
}

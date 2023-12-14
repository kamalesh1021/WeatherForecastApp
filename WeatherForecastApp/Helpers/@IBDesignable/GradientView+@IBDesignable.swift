//
//  GradientView+@IBDesignable.swift
//  WeatherForecastApp
//
//  Created by kamalesh on 14/12/23.
//

import UIKit


// `GradientView` is a custom UIView subclass that can be designed in Interface Builder.
@IBDesignable
class GradientView: UIView {
        @IBInspectable var startColor: UIColor = .blue {
            didSet {
                updateGradient()
            }
        }

        @IBInspectable var endColor: UIColor = .green {
            didSet {
                updateGradient()
            }
        }

        private var gradientLayer: CAGradientLayer!

        override init(frame: CGRect) {
            super.init(frame: frame)
            setup()
        }

        required init?(coder: NSCoder) {
            super.init(coder: coder)
            setup()
        }

        private func setup() {
            gradientLayer = CAGradientLayer()
            layer.insertSublayer(gradientLayer, at: 0)
            updateGradient()
        }

        override func layoutSubviews() {
            super.layoutSubviews()
            gradientLayer.frame = bounds
        }

        private func updateGradient() {
            gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        }
}

//
// Created by kimkyungsik on 2021/09/12.
//

import UIKit

extension UIColor {
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        return String(format:"#%06x", rgb)
    }
}

func getDegree(pattern:String)->Double{
    switch(pattern) {
    case "V":
        return 90
    case "H":
        return 0
    case "D":
        return -38
    default:
        return -38
    }
}

func getDegreeUiView(pattern:String)->CGAffineTransform{
    switch(pattern) {
    case "V":
        return CGAffineTransform(rotationAngle: .pi/2)
    case "H":
        return CGAffineTransform(rotationAngle: 0)
    case "D":
        return CGAffineTransform(rotationAngle: -.pi/4)
    default:
        return CGAffineTransform(rotationAngle: 0)
    }
}

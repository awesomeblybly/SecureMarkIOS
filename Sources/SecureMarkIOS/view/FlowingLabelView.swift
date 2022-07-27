//
//  SwiftUIView.swift
//  
//
//  Created by TAE JUN CHA on 2022/07/27.
//

import SwiftUI
import MarqueeLabel

struct FlowingLabelView : UIViewRepresentable {
    typealias UIViewType = MarqueeLabel
        
    var text: String
    var alpha: Double
    var color: UIColor
    var font: UIFont?
        
    func makeUIView(context: UIViewRepresentableContext<FlowingLabelView>) -> MarqueeLabel {
        
        let label = MarqueeLabel()
        label.text = text
        label.alpha = alpha
        label.textColor = color
        label.font = font
        label.speed = SpeedLimit.rate(1.0)
        label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        return label
        
    }
    
    func updateUIView(_ uiView: MarqueeLabel, context: UIViewRepresentableContext<FlowingLabelView>) { }
    
}

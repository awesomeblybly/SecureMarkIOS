//
//  SwiftUIView.swift
//  
//
//  Created by TAE JUN CHA on 2022/07/26.
//

import SwiftUI
import MarqueeLabel


struct WaterMarkView: View {
    @ObservedObject var viewModel: SecureMark
    
    var body: some View {
        ZStack{
            if viewModel.profile?.type == "T" {
                if viewModel.profile!.pattern == "F" {
                    WaterMarkFlowingView(viewModel: viewModel)
                } else {
                    WaterMarkTextView(viewModel: viewModel)
                }
            }else if viewModel.profile?.type == "I"{
                
            }
            viewModel.clientView
        }
    }
}

struct WaterMarkTextView: View{
    @ObservedObject var viewModel: SecureMark
    
    var body: some View{
        VStack(spacing: 70) {
            ForEach(0..<5, id: \.self) { _ in
                LazyHStack(alignment:.center, spacing: 70) {
                    ForEach(0..<5, id: \.self) { vItems in
                        VStack(spacing: 2) {
                            Text(viewModel.profile!.markers[0].content)
                                .font(.system(size: CGFloat(Float(viewModel.profile!.markers[0].size))))
                                .padding(.all)
                                .rotationEffect(.degrees(getDegree(pattern: viewModel.profile!.pattern)))
                                .foregroundColor(Color(UIColor(hexString: viewModel.profile!.markers[0].color)))
                                .mask(Color(UIColor(hexString: viewModel.profile!.markers[0].color)).opacity(viewModel.profile!.markers[0].opacity))
                            
                            
                            Text(viewModel.profile!.markers[1].content)
                            //                                        .offset(x: 10, y: 15)
                                .font(.system(size: CGFloat(Float(viewModel.profile!.markers[0].size))))
                                .padding(.all)
                                .rotationEffect(.degrees(getDegree(pattern: viewModel.profile!.pattern)))
                                .foregroundColor(Color(UIColor(hexString: viewModel.profile!.markers[1].color)))
                                .mask(Color(UIColor(hexString: viewModel.profile!.markers[1].color)).opacity(viewModel.profile!.markers[1].opacity))
                        }
                    }
                }.frame(minHeight: 150)
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .ignoresSafeArea()
    }
}


struct WaterMarkFlowingView: View {
    @ObservedObject var viewModel: SecureMark
    
    var body: some View {
        VStack(spacing: 70) {
            ForEach(0..<5) { _ in
                VStack(spacing: 2) {
                    FlowingLabelView(
                        text: viewModel.profile!.markers[0].content.multiply(5),
                        alpha: viewModel.profile!.markers[0].opacity,
                        color: UIColor(hexString: viewModel.profile!.markers[0].color),
                        font: UIFont(name: "AppleSDGothicNeo-Regular ",size: CGFloat(Float(viewModel.profile!.markers[0].size))))
                    
                    FlowingLabelView(
                        text: viewModel.profile!.markers[1].content.multiply(5),
                        alpha: viewModel.profile!.markers[1].opacity,
                        color: UIColor(hexString: viewModel.profile!.markers[1].color),
                        font: UIFont(name: "AppleSDGothicNeo-Regular ",size: CGFloat(Float(viewModel.profile!.markers[0].size))))
                }.frame(minHeight: 150)
            }
        }.frame(maxHeight: .infinity, alignment: .leading)
            .ignoresSafeArea()
    }
}

extension String{
    func multiply(_ time: Int) -> String {
        var temp = ""
        for _ in 0...time {
            temp += "  \(self)  "
        }
        return temp
    }
}

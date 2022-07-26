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
    @State var isRecording = false
    
    var body: some View {
        ZStack{
            
            if viewModel.profile?.config == "B" || viewModel.profile?.config == "W" {
                if viewModel.profile!.type == "T" {
                    if viewModel.profile!.pattern == "F" {
                        WaterMarkFlowingView(viewModel: viewModel)
                    } else {
                        WaterMarkTextView(viewModel: viewModel)
                    }
                }else if viewModel.profile?.type == "I"{
                    
                }
            }
            
            if viewModel.profile?.config == "B" || viewModel.profile?.config == "C" {
                if !isRecording {
                    viewModel.clientView
                }
            }
            
        }.onReceive(NotificationCenter.default.publisher(for: UIScreen.capturedDidChangeNotification), perform: {_ in
            isRecording = UIScreen.main.isCaptured
            print("isRecording : \(isRecording)")
        })
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
                                .foregroundColor(Color(UIColor(hexString: viewModel.profile!.markers[0].color)))
                                .mask(Color(UIColor(hexString: viewModel.profile!.markers[0].color)).opacity(viewModel.profile!.markers[0].opacity))
                            
                            
                            Text(viewModel.profile!.markers[1].content)
                            //                                        .offset(x: 10, y: 15)
                                .font(.system(size: CGFloat(Float(viewModel.profile!.markers[0].size))))
                                .padding(.all)
                                .foregroundColor(Color(UIColor(hexString: viewModel.profile!.markers[1].color)))
                                .mask(Color(UIColor(hexString: viewModel.profile!.markers[1].color)).opacity(viewModel.profile!.markers[1].opacity))
                            
                        }.rotationEffect(.degrees(getDegree(pattern: viewModel.profile!.pattern)), anchor: .center)
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
                        text: viewModel.profile!.markers[0].content.multiply(6),
                        alpha: viewModel.profile!.markers[0].opacity,
                        color: UIColor(hexString: viewModel.profile!.markers[0].color),
                        font: UIFont(name: "AppleSDGothicNeo-Regular ",size: CGFloat(Float(viewModel.profile!.markers[0].size))))
                    
                    FlowingLabelView(
                        text: viewModel.profile!.markers[1].content.multiply(6),
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

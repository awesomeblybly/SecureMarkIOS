//
//  SwiftUIView.swift
//  
//
//  Created by TAE JUN CHA on 2022/07/26.
//

import SwiftUI

var items: [GridItem] = Array(repeating: .init(.flexible()), count: 2)

struct WaterMarkView: View {
    @ObservedObject var viewModel: SecureMark
    
    var body: some View {
        ZStack{
            viewModel.clientView
            if viewModel.profile != nil {
                VStack {
                    ForEach(0..<4, id: \.self) { _ in
                        LazyVGrid(columns: items, spacing: 0) {
                            ForEach(0..<items.count, id: \.self) { vItems in
                                ZStack {
                                    Text(viewModel.profile!.markers[0].content)
                                        .font(.system(size: CGFloat(Float(viewModel.profile!.markers[0].size))))
                                        .padding(.all)
                                        .rotationEffect(.degrees(getDegree(pattern: viewModel.profile!.pattern)))
                                        .foregroundColor(Color(UIColor(hexString: viewModel.profile!.markers[0].color)))
                                        .mask(Color(UIColor(hexString: viewModel.profile!.markers[0].color)).opacity(viewModel.profile!.markers[0].opacity))
                                        .frame(maxWidth: .infinity, minHeight: 150, maxHeight: .infinity, alignment: .center)
                                    Text(viewModel.profile!.markers[1].content)
                                        .offset(x: 10, y: 15)
                                        .font(.system(size: CGFloat(Float(viewModel.profile!.markers[1].size))))
                                        .padding(.all)
                                        .rotationEffect(.degrees(getDegree(pattern: viewModel.profile!.pattern)))
                                        .foregroundColor(Color(UIColor(hexString: viewModel.profile!.markers[1].color)))
                                        .mask(Color(UIColor(hexString: viewModel.profile!.markers[1].color)).opacity(viewModel.profile!.markers[1].opacity))
                                        .frame(maxWidth: .infinity, minHeight: 150, maxHeight: .infinity, alignment: .center)
                                }.background(Color.clear)
                            }
                        }
                    }
                }
            }
        }
    }
}



//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        WaterMarkView(viewModel: SecureMark.share)
//    }
//}

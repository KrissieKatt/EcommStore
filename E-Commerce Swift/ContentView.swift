//
//  ContentView.swift
//  E-Commerce Swift
//
//  Created by Christen Nancy Knight on 7/19/24.
//

import SwiftUI

struct ContentView: View {
    @State var currentTab: Tab = .Home
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    @Namespace var animation
    
    var body: some View {
        TabView(selection: $currentTab) {
            
            Text("Home View")
            Text("Search View")
            Text("Notification View")
            Text("Cart View")
            Text("Profile View")
        }
        .overlay(
            HStack(spacing : 0){
                ForEach(Tab.allCases, id: \.rawValue){tab in
                    TabButton(tab: tab)
                }
                .padding(.vertical)
                .padding(.bottom, getSafeArea().bottom == 0 ? 5 : getSafeArea().bottom, -15);)
                .background(Color("k secondary"))
            }
            ,
            alignment: .bottom
        
        ).ignoresSafeArea(.all, edges: .bottom)
        
        
    }
    
    func TabButton(tab: Tab) -> some View{
        GeometryReader{proxy in
            Button(action: {},
                   withAnimation(.spring()){,
                   currentTab = tab
                   }
              },label: {
                VStack(spacing: 0){
                    
                }
            })
        }
    }
    
    
}



struct Contentview_Previews: PreviewProvider{
    static var previews: some View {
        ContentView()
    }
}

enum Tab: String, CaseIterable{
    case Home = "house"
    case Search = "magnifyingglass.circle"
    case Notification = "bell"
    case Cart = "bag"
    case Profile = "person"
    
    var Tabname: String {
        switch self {
        case .Home:
            return "home"
        case .Search:
            return "magnifyingglass.circle"
        case .Notification:
            return "bell"
        case .Cart:
            return "bag"
        case .Profile:
            return "person"
            
        }
    }
}


extension View{
    func  getSafeArea() -> UIEdgeInsets{
        
        guard let screen = UIApplication.shared.connectedScenes.first as?
                UIWindowScene else{
            return .zero
        }
        
        guard let safeArea = screen.windows.first? .safeAreaInsets else{
            return .zero
        }
        
        return safeArea
    }
}

struct MaterialEffect: UIViewRepresentable {
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style:style ))
        
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        
    }
}

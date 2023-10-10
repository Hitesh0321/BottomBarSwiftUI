

import SwiftUI

enum BottomBarSelectedTab:Int{
    case home = 0
    case search = 1
    case plus = 2
    case notification = 3
    case profile = 4
}
struct BottomBar: View {
    @Environment(\.safeAreaInsets) var safeAreaInsets
    @Environment(\.colorScheme) var colorScheme
    @Binding var selectedTab:BottomBarSelectedTab
    var body: some View {

        HStack(spacing: 10){
            //Home
            Button {
                selectedTab = .home
            } label: {
                ZStack{
                    BottomBarButtonView(image: "house.fill", text: "Home", isActive: selectedTab == .home)
                }
            }
            
            
            //Search
            Button {
                    selectedTab = .search
                } label: {
                    BottomBarButtonView(image: "magnifyingglass", text: "Search", isActive: selectedTab == .search)
                }
                
                Button {
                    selectedTab = .plus

                } label: {
                    VStack{
                        ZStack{
                            VStack(spacing: 3){
                                RoundedRectangle(cornerRadius: 30)
                                    .frame(width: 60,height: 60)
                                    .foregroundColor(.purple)
                                
                            }
                            VStack(spacing: 3){
                                Image(systemName: "plus").font(.title).foregroundColor(.white)
                                
                            }
                        }.padding(EdgeInsets(top: (UIDevice.isIPad ? -21 : -23), leading: 0, bottom: 0, trailing: 0))
                            Spacer()
                                                
                    }
                }
                //Notification
                Button {
                    selectedTab = .notification
                } label: {
                    BottomBarButtonView(image: "bell", text: "Notification", isActive: selectedTab == .notification)
                }
                //Profile
                Button {
                    selectedTab = .profile
                } label: {
                    
                    BottomBarButtonView(image: "person", text: "Profile", isActive: selectedTab == .profile)
                }
            }
            .frame(height: 40)
            .background(
                Image("bottomBarBG").renderingMode(.template).foregroundColor(Color("PrimaryWhite"))
                    )
            .shadow(color: Color("PrimaryBlack").opacity(colorScheme == .dark ? 0.5 : 0.1), radius: 10, x: 0,y: 0)
        
        
    }
}

struct BottomBar_Previews: PreviewProvider {
    static var previews: some View {
        BottomBar(selectedTab: .constant(.plus))
    }
}

struct BottomBarButtonView: View {
    
    var image:String
    var text:String
    var isActive:Bool
    
    var body: some View {
        HStack(spacing: 10){
                GeometryReader{
                    geo in
                    VStack(spacing: UIDevice.isIPad ? 6 : 3){
                        Rectangle()
                            .frame(height: 0)
                        Image(image)
                            .resizable()
                            .frame(width: UIDevice.isIPad ? 30 : 24,height: UIDevice.isIPad ? 30 : 24)
                            .foregroundColor(isActive ? .purple : .gray)
                        Text(text)
                            .font(.caption)
                            .foregroundColor(isActive ? .purple : .gray)
                    }
                }
            
        }
    }
}

//
//  CrewListItemView.swift
//  Moonshot
//
//  Created by Andre Silva on 24/04/2022.
//

import SwiftUI

struct CrewListItemView: View {
    let crewMember: CrewMember
    
    var body: some View {
        HStack {
            Image(crewMember.astronaut.id)
                .resizable()
                .frame(width: 104, height: 72)
                .clipShape(Capsule())
                .overlay(Capsule().strokeBorder(.white, lineWidth: 1))
            VStack(alignment: .leading){
                Text(crewMember.astronaut.name)
                    .foregroundColor(.white)
                    .font(.headline)
                Text(crewMember.role)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.horizontal)
    }
}

struct CrewListItemView_Previews: PreviewProvider {
    static var previews: some View {
        let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
        let crewMember = CrewMember(role: "Command Pilot", astronaut: astronauts["grissom"]!)
        
        CrewListItemView(crewMember: crewMember)
    }
}

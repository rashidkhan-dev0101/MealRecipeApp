//
//  GradientButton.swift
//  MealRecipeApp
//
//  Created by RASHID on 08/07/2026.
//

import SwiftUI


struct GradientButton: View {

    let action:()->Void

    var body: some View {

        Button(action: action){

            Image(systemName:"arrow.right")
                .font(.title2.bold())
                .foregroundStyle(.white)
                .frame(width:62,height:48)
                .background(

                    LinearGradient(
                        colors:[
                            Color.pink,
                            Color.purple
                        ],
                        startPoint:.leading,
                        endPoint:.trailing
                    )

                )
                .clipShape(Capsule())

        }

    }

}

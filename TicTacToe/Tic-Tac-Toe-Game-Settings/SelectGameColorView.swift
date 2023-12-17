//
//  SelectGameColorView.swift
//  Tic-Tac-Toe-Game-Settings
//
//  Created by Justin Wong on 10/4/23.
//

import SwiftUI

struct SelectGameColorView: View {
    @Environment (\.dismiss) var dismiss
    @ObservedObject var viewModel: GameViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                selectColorHeader
                grid
            }
            .navigationTitle("Set Grid Color")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                            .font(.system(size: 30))
                    }
                }
            }
        }
    }
    
    private var selectColorHeader: some View {
        HStack (spacing: 20) {
            Text("Selected Grid Color:")
                .font(.title).bold()
            RoundedRectangle(cornerRadius: 10).fill(viewModel.gridColor)
                .frame(width: 50, height: 50)
        }
    }
    
    private var grid: some View {
        Grid {
            GridRow {
                ColorCircleView(color: .red, selectedColor: $viewModel.gridColor)
                ColorCircleView(color: .green, selectedColor: $viewModel.gridColor)
                ColorCircleView(color: .blue, selectedColor: $viewModel.gridColor)
            }
            GridRow {
                ColorCircleView(color: .purple, selectedColor: $viewModel.gridColor)
                ColorCircleView(color: .yellow, selectedColor: $viewModel.gridColor)
                ColorCircleView(color: .black, selectedColor: $viewModel.gridColor)
            }
            GridRow {
                ColorCircleView(color: .brown, selectedColor: $viewModel.gridColor)
                ColorCircleView(color: .cyan, selectedColor: $viewModel.gridColor)
                ColorCircleView(color: .indigo, selectedColor: $viewModel.gridColor)
            }
        }
        
        
    }
}

struct ColorCircleView: View {
    var color: Color
    @Binding var selectedColor: Color

    var body: some View {
        Circle()
            .fill(selectedColor == color ? .indigo.opacity(0.3) : .clear)
            .frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            .overlay {
                Circle()
                    .fill(color)
                    .frame(width: 80, height: 80)
                    .onTapGesture {
                        selectedColor = color
                    }
            }
    }
}

#Preview {
    SelectGameColorView(viewModel: GameViewModel())
}

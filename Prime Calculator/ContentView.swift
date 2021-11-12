//
//  ContentView.swift
//  Prime Calculator
//
//  Created by Luke Drushell on 11/4/21.
//

import SwiftUI


struct ContentView: View {
    
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 4)
    var columns3: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    @State var showExtra = false
    @State var extraPadding = 1
    @State var theOperator = false
    @State var calcInputs: [String] = []
    @State var output = ""
    @State var opPressed = false
    @State var calcReset = true
    @State var calculations = CalculationCount.loadFromFile()
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            VStack {
                
                Spacer()
                
                VStack() {
                    
                    Spacer()
                    
                    Text(calcInputs.isEmpty ? output : calculationViewer(inputs: calcInputs))
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width, height: 100, alignment: .trailing)
                        .font(.system(size: 70))
                        .minimumScaleFactor(0.3)
                        .lineLimit(3)
                        .truncationMode(.head)
                        .allowsTightening(true)
                        .padding(.top, 100)
                    
                    LazyVGrid(columns: columns, spacing: 10, content: {
                        Group {
                            Button {
                                output = ""
                                calcInputs = []
                                opPressed = false
                                calcReset = true
                            } label: {
                                Text(calcInputs == [] ? "AC" : "C")
                                    .background(
                                        Circle()
                                            .frame(width: 75, height: 75, alignment: .center)
                                            .foregroundColor(Color(UIColor.lightGray))
                                            .padding(5)
                                    )
                                    .frame(width: 75, height: 75, alignment: .center)
                                    .font(.custom("buttonText", size: 30))
                                    .foregroundColor(.black)
                                    .padding(5)
                            }
                            Button {
                                calcInputs.append("neg")
                                opPressed = true
                            } label: {
                                Text("-")
                                    .background(
                                        Circle()
                                            .frame(width: 75, height: 75, alignment: .center)
                                            .foregroundColor(Color(UIColor.lightGray))
                                            .padding(5)
                                    )
                                    .frame(width: 75, height: 75, alignment: .center)
                                    .font(.custom("buttonText", size: 35))
                                    .foregroundColor(.black)
                                    .padding(5)
                            }
                            Button {
                                calcInputs.append("per")
                                opPressed = true
                            } label: {
                                Text("%")
                                    .background(
                                        Circle()
                                            .frame(width: 75, height: 75, alignment: .center)
                                            .foregroundColor(Color(UIColor.lightGray))
                                            .padding(5)
                                    )
                                    .frame(width: 75, height: 75, alignment: .center)
                                    .font(.custom("buttonText", size: 30))
                                    .foregroundColor(.black)
                                    .padding(5)
                            }
                            Button {
                                calcInputs.append("/")
                                opPressed = true
                            } label: {
                                Text("/")
                                    .background(
                                        Circle()
                                            .frame(width: 75, height: 75, alignment: .center)
                                            .foregroundColor(Color(UIColor.systemOrange))
                                            .padding(5)
                                    )
                                    .frame(width: 75, height: 75, alignment: .center)
                                    .font(.custom("buttonText", size: 35))
                                    .foregroundColor(.white)
                                    .padding(5)
                            }
                        }
                        Group {
                            Button {
                                if opPressed || calcReset == true {
                                    calcInputs.append("7")
                                } else {
                                    calcInputs[calcInputs.count-1] = "\(calcInputs[calcInputs.count-1])7"
                                }
                                opPressed = false
                                calcReset = false
                            } label: {
                                Text("7")
                                    .background(
                                        Circle()
                                            .frame(width: 75, height: 75, alignment: .center)
                                            .foregroundColor(Color(UIColor.darkGray))
                                            .padding(5)
                                    )
                                    .frame(width: 75, height: 75, alignment: .center)
                                    .font(.custom("buttonText", size: 38))
                                    .foregroundColor(.white)
                                    .padding(5)
                            }
                            Button {
                                if opPressed || calcReset == true {
                                    calcInputs.append("8")
                                } else {
                                    calcInputs[calcInputs.count-1] = "\(calcInputs[calcInputs.count-1])8"
                                }
                                opPressed = false
                                calcReset = false
                            } label: {
                                Text("8")
                                    .background(
                                        Circle()
                                            .frame(width: 75, height: 75, alignment: .center)
                                            .foregroundColor(Color(UIColor.darkGray))
                                            .padding(5)
                                    )
                                    .frame(width: 75, height: 75, alignment: .center)
                                    .font(.custom("buttonText", size: 38))
                                    .foregroundColor(.white)
                                    .padding(5)
                            }
                            Button {
                                if opPressed || calcReset == true {
                                    calcInputs.append("9")
                                } else {
                                    calcInputs[calcInputs.count-1] = "\(calcInputs[calcInputs.count-1])9"
                                }
                                opPressed = false
                                calcReset = false
                            } label: {
                                Text("9")
                                    .background(
                                        Circle()
                                            .frame(width: 75, height: 75, alignment: .center)
                                            .foregroundColor(Color(UIColor.darkGray))
                                            .padding(5)
                                    )
                                    .frame(width: 75, height: 75, alignment: .center)
                                    .font(.custom("buttonText", size: 38))
                                    .foregroundColor(.white)
                                    .padding(5)
                            }
                            Button {
                                calcInputs.append("*")
                                opPressed = true
                            } label: {
                                Text("×")
                                    .background(
                                        Circle()
                                            .frame(width: 75, height: 75, alignment: .center)
                                            .foregroundColor(Color(UIColor.systemOrange))
                                            .padding(5)
                                    )
                                    .frame(width: 75, height: 75, alignment: .center)
                                    .font(.custom("buttonText", size: 38))
                                    .foregroundColor(.white)
                                    .padding(5)
                            }
                        }
                        Group {
                            Button {
                                if opPressed || calcReset == true {
                                    calcInputs.append("4")
                                    calcReset = false
                                } else {
                                    calcInputs[calcInputs.count-1] = "\(calcInputs[calcInputs.count-1])4"
                                }
                                opPressed = false
                                calcReset = false
                            } label: {
                                Text("4")
                                    .background(
                                        Circle()
                                            .frame(width: 75, height: 75, alignment: .center)
                                            .foregroundColor(Color(UIColor.darkGray))
                                            .padding(5)
                                    )
                                    .frame(width: 75, height: 75, alignment: .center)
                                    .font(.custom("buttonText", size: 38))
                                    .foregroundColor(.white)
                                    .padding(5)
                            }
                            Button {
                                if opPressed || calcReset == true {
                                    calcInputs.append("5")
                                } else {
                                    calcInputs[calcInputs.count-1] = "\(calcInputs[calcInputs.count-1])5"
                                }
                                opPressed = false
                                calcReset = false
                            } label: {
                                Text("5")
                                    .background(
                                        Circle()
                                            .frame(width: 75, height: 75, alignment: .center)
                                            .foregroundColor(Color(UIColor.darkGray))
                                            .padding(5)
                                    )
                                    .frame(width: 75, height: 75, alignment: .center)
                                    .font(.custom("buttonText", size: 38))
                                    .foregroundColor(.white)
                                    .padding(5)
                            }
                            Button {
                                if opPressed || calcReset == true {
                                    calcInputs.append("6")
                                } else {
                                    calcInputs[calcInputs.count-1] = "\(calcInputs[calcInputs.count-1])6"
                                }
                                opPressed = false
                                calcReset = false
                            } label: {
                                Text("6")
                                    .background(
                                        Circle()
                                            .frame(width: 75, height: 75, alignment: .center)
                                            .foregroundColor(Color(UIColor.darkGray))
                                            .padding(5)
                                    )
                                    .frame(width: 75, height: 75, alignment: .center)
                                    .font(.custom("buttonText", size: 38))
                                    .foregroundColor(.white)
                                    .padding(5)
                            }
                            Button {
                                calcInputs.append("-")
                                opPressed = true
                            } label: {
                                Text("-")
                                    .background(
                                        Circle()
                                            .frame(width: 75, height: 75, alignment: .center)
                                            .foregroundColor(Color(UIColor.systemOrange))
                                            .padding(5)
                                    )
                                    .frame(width: 75, height: 75, alignment: .center)
                                    .font(.custom("buttonText", size: 38))
                                    .foregroundColor(.white)
                                    .padding(5)
                            }
                        }
                        Group {
                            Button {
                                if opPressed || calcReset == true {
                                    calcInputs.append("1")
                                } else {
                                    calcInputs[calcInputs.count-1] = "\(calcInputs[calcInputs.count-1])1"
                                }
                                opPressed = false
                                calcReset = false
                            } label: {
                                Text("1")
                                    .background(
                                        Circle()
                                            .frame(width: 75, height: 75, alignment: .center)
                                            .foregroundColor(Color(UIColor.darkGray))
                                            .padding(5)
                                    )
                                    .frame(width: 75, height: 75, alignment: .center)
                                    .font(.custom("buttonText", size: 38))
                                    .foregroundColor(.white)
                                    .padding(5)
                            }
                            Button {
                                if opPressed || calcReset == true {
                                    calcInputs.append("2")
                                } else {
                                    calcInputs[calcInputs.count-1] = "\(calcInputs[calcInputs.count-1])2"
                                }
                                opPressed = false
                                calcReset = false
                            } label: {
                                Text("2")
                                    .background(
                                        Circle()
                                            .frame(width: 75, height: 75, alignment: .center)
                                            .foregroundColor(Color(UIColor.darkGray))
                                            .padding(5)
                                    )
                                    .frame(width: 75, height: 75, alignment: .center)
                                    .font(.custom("buttonText", size: 38))
                                    .foregroundColor(.white)
                                    .padding(5)
                            }
                            Button {
                                if opPressed || calcReset == true {
                                    calcInputs.append("3")
                                } else {
                                    calcInputs[calcInputs.count-1] = "\(calcInputs[calcInputs.count-1])3"
                                }
                                opPressed = false
                                calcReset = false
                            } label: {
                                Text("3")
                                    .background(
                                        Circle()
                                            .frame(width: 75, height: 75, alignment: .center)
                                            .foregroundColor(Color(UIColor.darkGray))
                                            .padding(5)
                                    )
                                    .frame(width: 75, height: 75, alignment: .center)
                                    .font(.custom("buttonText", size: 38))
                                    .foregroundColor(.white)
                                    .padding(5)
                            }
                            Button {
                                calcInputs.append("+")
                                opPressed = true
                            } label: {
                                Text("+")
                                    .background(
                                        Circle()
                                            .frame(width: 75, height: 75, alignment: .center)
                                            .foregroundColor(Color(UIColor.systemOrange))
                                            .padding(5)
                                    )
                                    .frame(width: 75, height: 75, alignment: .center)
                                    .font(.custom("buttonText", size: 38))
                                    .foregroundColor(.white)
                                    .padding(5)
                            }
                        }
                    })
                        .padding(.horizontal)
                    HStack {
                        Button {
                            if opPressed || calcReset == true {
                                calcInputs.append("0")
                            } else {
                                calcInputs[calcInputs.count-1] = "\(calcInputs[calcInputs.count-1])0"
                            }
                            opPressed = false
                            calcReset = false
                        } label: {
                            Text("0")
                                .background(
                                    Capsule()
                                        .frame(width: 160, height: 75, alignment: .center)
                                        .foregroundColor(Color(UIColor.darkGray))
                                        .padding(5)
                                )
                                .frame(width: 160, height: 75, alignment: .center)
                                .font(.custom("buttonText", size: 38))
                                .foregroundColor(.white)
                                .padding(5)
                        }
                        Button {
                            if opPressed || calcReset == true {
                                calcInputs.append(".")
                            } else {
                                calcInputs[calcInputs.count-1] = "\(calcInputs[calcInputs.count-1])."
                            }
                            opPressed = false
                            calcReset = false
                        } label: {
                            Text(".")
                                .background(
                                    Circle()
                                        .frame(width: 75, height: 75, alignment: .center)
                                        .foregroundColor(Color(UIColor.darkGray))
                                        .padding(5)
                                )
                                .frame(width: 75, height: 75, alignment: .center)
                                .font(.custom("buttonText", size: 38))
                                .foregroundColor(.white)
                                .padding(5)
                        }
                        Button {
                            if bigBoyError(inputs: calcInputs) {
                                calcInputs = []
                                output = "Error"
                                calcReset = true
                            } else {
                                var result = showCalculations(inputs: calcInputs)
                                if result == "" || result == " " { result = "0" }
                                let expn = NSExpression(format: result)
                                let calculated = expn.expressionValue(with: nil, context: nil) ?? "error"
                                let stringResult = "\(calculated)"
                                output = "\(Double(stringResult) ?? 0)"
                                if "\(output.suffix(2))" == ".0" {
                                    output = "\(Int(stringResult) ?? 0)"
                                }
                                calcInputs = [output]
                            }
                            if calculations.isEmpty {
                                CalculationCount.saveToFile([CalculationCount(num: 1)])
                            } else {
                                calculations[0].num += 1
                                CalculationCount.saveToFile(calculations)
                            }
                        } label: {
                            Text("=")
                                .background(
                                    Circle()
                                        .frame(width: 75, height: 75, alignment: .center)
                                        .foregroundColor(Color(UIColor.systemOrange))
                                        .padding(5)
                                )
                                .frame(width: 75, height: 75, alignment: .center)
                                .font(.custom("buttonText", size: 38))
                                .foregroundColor(.white)
                                .padding(5)
                        }
                    }
                    
                    
                    Spacer()
                    
                    Group {
                    Button {
                        withAnimation {
                            showExtra.toggle()
                        }
                    } label: {
                        Color.gray.opacity(0.5)
                            .frame(width: UIScreen.main.bounds.width, height: 45, alignment: .center)
                            .cornerRadius(20, corners: [.topLeft, .topRight])
                            .overlay(
                                Image(systemName: "chevron.up")
                                    .resizable()
                                    .frame(width: 20, height: 6.6, alignment: .center)
                                    .font(Font.title.weight(.bold))
                                    .foregroundColor(.gray)
                                    .rotationEffect(showExtra ? .degrees(180) : .degrees(0))
                            )
                            .edgesIgnoringSafeArea(.all)
                    } .padding(.bottom, 11.5)

                    Color.gray.opacity(0.3)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.3, alignment: .center)
                        .padding(-20)
                        .overlay(
                            LazyVGrid(columns: columns3, spacing: -5, content: {
                                Group {
                                    Button {
                                        calcInputs.append("inv")
                                    } label: {
                                        Text("^-1")
                                            .foregroundColor(.black)
                                            .bold()
                                            .background(
                                                Capsule()
                                                    .frame(width: 85, height: 35, alignment: .center)
                                                    .foregroundColor(Color(UIColor.lightGray))
                                        )
                                            .frame(width: 100, height: 50, alignment: .center)
                                    }
                                    Button {
                                        calcInputs.append("para1")
                                    } label: {
                                        Text("(")
                                            .foregroundColor(.black)
                                            .bold()
                                            .background(
                                                Capsule()
                                                    .frame(width: 85, height: 35, alignment: .center)
                                                    .foregroundColor(Color(UIColor.lightGray))
                                        )
                                            .frame(width: 100, height: 50, alignment: .center)
                                    }
                                    Button {
                                        calcInputs.append("para2")
                                    } label: {
                                        Text(")")
                                            .foregroundColor(.black)
                                            .bold()
                                            .background(
                                                Capsule()
                                                    .frame(width: 85, height: 35, alignment: .center)
                                                    .foregroundColor(Color(UIColor.lightGray))
                                        )
                                            .frame(width: 100, height: 50, alignment: .center)
                                    }
                                }
                                .padding(.vertical, -4)
                                Group {
                                    Button {
                                        calcInputs.append("sqrt")
                                    } label: {
                                        Text("√")
                                            .foregroundColor(.black)
                                            .bold()
                                            .background(
                                                Capsule()
                                                    .frame(width: 85, height: 35, alignment: .center)
                                                    .foregroundColor(Color(UIColor.lightGray))
                                        )
                                            .frame(width: 100, height: 50, alignment: .center)
                                    }
                                    Button {
                                        calcInputs.append("ex")
                                        opPressed = true
                                    } label: {
                                        Text("^")
                                            .foregroundColor(.black)
                                            .bold()
                                            .background(
                                                Capsule()
                                                    .frame(width: 85, height: 35, alignment: .center)
                                                    .foregroundColor(Color(UIColor.lightGray))
                                        )
                                            .frame(width: 100, height: 50, alignment: .center)
                                    }
                                    Button {
                                        calcInputs.append("log")
                                    } label: {
                                        Text("log()")
                                            .foregroundColor(.black)
                                            .bold()
                                            .background(
                                                Capsule()
                                                    .frame(width: 85, height: 35, alignment: .center)
                                                    .foregroundColor(Color(UIColor.lightGray))
                                        )
                                            .frame(width: 100, height: 50, alignment: .center)
                                    }
                                }
                                .padding(.vertical, -4)
                                Group {
                                    Button {
                                        calcInputs.append("sin")
                                    } label: {
                                        Text("sin")
                                            .foregroundColor(.black)
                                            .bold()
                                            .background(
                                                Capsule()
                                                    .frame(width: 85, height: 35, alignment: .center)
                                                    .foregroundColor(Color(UIColor.lightGray))
                                        )
                                            .frame(width: 100, height: 50, alignment: .center)
                                    }
                                    Button {
                                        calcInputs.append("cos")
                                    } label: {
                                        Text("cos")
                                            .foregroundColor(.black)
                                            .bold()
                                            .background(
                                                Capsule()
                                                    .frame(width: 85, height: 35, alignment: .center)
                                                    .foregroundColor(Color(UIColor.lightGray))
                                        )
                                            .frame(width: 100, height: 50, alignment: .center)
                                    }
                                    Button {
                                        calcInputs.append("tan")
                                    } label: {
                                        Text("tan")
                                            .foregroundColor(.black)
                                            .bold()
                                            .background(
                                                Capsule()
                                                    .frame(width: 85, height: 35, alignment: .center)
                                                    .foregroundColor(Color(UIColor.lightGray))
                                        )
                                        .frame(width: 100, height: 50, alignment: .center)
                                    }
                                }
                                .padding(.vertical, -4)
                            })
                                .padding(.horizontal)
                                .padding(.top, -95)
                        )
                        .padding(.bottom, showExtra ? 20 : -300)
                    }
                    //.padding(.top, -50)
                
                }
                .edgesIgnoringSafeArea(.all)
            } .edgesIgnoringSafeArea(.all)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

func showCalculations(inputs: [String]) -> String {
    var inputsEditable = inputs
    var result = ""
    let itemCount = inputs.count - 1
    var loopLock = false
    
    for i in 0...itemCount {
        if inputsEditable[i].contains(".") == false && isOperator(item: inputs[i]) == false {
            inputsEditable[i] = "\(inputsEditable[i]).0"
        }
    }
    
    if itemCount > -1 {
        for i in 0...itemCount {
            if loopLock == false {
                switch inputsEditable[i] {
                    case "+":
                        result.append("+")
                    case "-":
                        result.append("-")
                    case "/":
                        result.append("/")
                    case "*":
                        result.append("*")
                    case "neg":
                        result.append("(-")
                    case "para1":
                        result.append("(")
                    case "para2":
                        result.append(")")
                    case "log":
                        if itemCount > i {
                            result.append("\(log10((Double(inputsEditable[i+1]) ?? 0)))")
                            loopLock = true
                        }
                    case "inv":
                        result.append("**(-1)")
                    case "sqrt":
                        if itemCount > i {
                            result.append("\((Double(inputsEditable[i+1]) ?? 0).squareRoot())")
                            loopLock = true
                        }
                    case "ex":
                        result.append("**")
                    case "cos":
                        if itemCount > i {
                            result.append("\(cos((Double(inputsEditable[i+1]) ?? 0) * Double.pi / 180))")
                            loopLock = true
                        }
                    case "sin":
                        if itemCount > i {
                            result.append("\(sin((Double(inputsEditable[i+1]) ?? 0) * Double.pi / 180))")
                            loopLock = true
                        }
                    case "tan":
                        if itemCount > i {
                            result.append("\(tan((Double(inputsEditable[i+1]) ?? 0) * Double.pi / 180))")
                            loopLock = true
                        }
                    case "per":
                        result.append("/100.0")
                    default:
                        result.append(inputsEditable[i])
                }
            } else {
                loopLock = false
            }
        }
    }
    return result
}

func calculationViewer(inputs: [String]) -> String {
    
    if inputs == [] { return "" }
    
    var result = ""
    let itemCount = inputs.count - 1
    if itemCount > -1 {
        for i in 0...itemCount {
            switch inputs[i] {
                case "+":
                    result.append("+")
                case "-":
                    result.append("-")
                case "/":
                    result.append("/")
                case "*":
                    result.append("*")
                case "neg":
                    result.append("(-")
                case "para1":
                    result.append("(")
                case "para2":
                    result.append(")")
                case "log":
                    result.append("log")
                case "inv":
                    result.append("^-1")
                case "sqrt":
                    result.append("√")
                case "ex":
                    result.append("^")
                case "cos":
                    result.append("cos")
                case "sin":
                    result.append("sin")
                case "tan":
                    result.append("tan")
                case "per":
                    result.append("%")
                default:
                    result.append(inputs[i])
            }
        }
    }
    return result
}

func isOperator(item: String) -> Bool {
    var result = false
    switch item {
        case "+":
            result = true
        case "-":
            result = true
        case "/":
            result = true
        case "*":
            result = true
        case "neg":
            result = true
        case "para1":
            result = true
        case "para2":
            result = true
        case "log":
            result = true
        case "inv":
            result = true
        case "sqrt":
            result = true
        case "ex":
            result = true
        case "cos":
            result = true
        case "sin":
            result = true
        case "tan":
            result = true
        case "per":
            result = true
        default:
            result = false
    }
    
    return result
    
}

func isOperatorAlt(item: String) -> Bool {
    var result = false
    
    var dupe = item
    if dupe.removeLast() == "." { return true }
    
    switch item {
        case "+":
            result = true
        case "-":
            result = true
        case "/":
            result = true
        case "*":
            result = true
        case "neg":
            result = true
        case "para1":
            result = true
        case "para2":
            result = false
        case "log":
            result = true
        case "inv":
            result = false
        case "sqrt":
            result = true
        case "ex":
            result = true
        case "cos":
            result = true
        case "sin":
            result = true
        case "tan":
            result = true
        case "per":
            result = false
        default:
            result = false
    }
    
    return result
    
}

func isOperatorAlt2(item: String) -> Bool {
    var result = false
    
    var dupe = item
    if dupe.removeLast() == "." { return true }
    
    switch item {
        case "+":
            result = true
        case "-":
            result = true
        case "/":
            result = true
        case "*":
            result = true
        case "neg":
            result = true
        case "para1":
            result = true
        case "para2":
            result = false
        case "log":
            result = true
        case "inv":
            result = true
        case "sqrt":
            result = false
        case "ex":
            result = true
        case "cos":
            result = true
        case "sin":
            result = true
        case "tan":
            result = true
        case "per":
            result = false
        default:
            result = false
    }
    
    return result
    
}

func tooManyDecimals(items: [String]) -> Bool {
    var result = false
    for i in 0...items.count - 1 {
        let array = items[i].components(separatedBy: ".")
        if array.count > 2 {
            result = true
        }
    }
    return result
}

func earlyPercentage(items: [String]) -> Bool {
    var result = false
    for i in 0...items.count - 1 {
        if items[i] == "per" {
            if i - 1 >= 0 {
                if isOperator(item: items[i-1]) {
                    result = true
                } else {
                    result = false
                }
            } else {
                result = true
            }
        }
    }
    return result
}

func extrenuousParaenthasis(items: [String]) -> Bool {
    var result = false
    
    let calcString = showCalculations(inputs: items)
    let open: Character = "("
    let closed: Character = ")"
    let openCount = calcString.filter { $0 == open }.count
    let closedCount = calcString.filter { $0 == closed }.count
    if openCount != closedCount { result = true }
    
    var stillOpen = false
    for i in 0...items.count - 1 {
        if items[i] == "para1" { stillOpen = true }
        if items[i] == "para2" { stillOpen = false }
    }
    
    var emptyParaenthasis = false
    for i in 0...items.count - 1 {
        if items[i] == "para1" {
            if items.count > i {
                if items[i+1] == "para2" { emptyParaenthasis = true }
            }
        }
    }
    
    return result || stillOpen || emptyParaenthasis
}


func bigBoyError(inputs: [String]) -> Bool {
    var result = false
    if isOperatorAlt(item: inputs.last ?? "") {
        result = true
    } else if tooManyDecimals(items: inputs) {
        result = true
    } else if earlyPercentage(items: inputs) {
        result = true
    } else if extrenuousParaenthasis(items: inputs) {
        result = true
    } else if isOperatorAlt2(item: inputs.first ?? "") {
        result = true
    }
    return result
}


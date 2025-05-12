// SwiftFormat Header Here
// SwiftFormat Header Here

// Project: AgencyKitXCMCP (com.makememonad.AgencyKitXCMCP)
// Target: AgencyKitXCMCP (com.makememonad.AgencyKitXCMCP.AgencyKitXCMCP)
// Relevant (LINK)
// Purpose: BasicFileTemplate

import MCP

func registerTools(to server: isolated Server) async {

	// Registering the tool list handler
	server.withMethodHandler(ListTools.self) { _ in .init(tools: allTools)}

	// Registering the tool call handler
	server.withMethodHandler(CallTool.self) { params in
		switch params.name {
			case "weather":
				let location = params.arguments?["location"]?.stringValue ?? "Unknown"
				let units = params.arguments?["units"]?.stringValue ?? "metric"
				let weatherData = getWeatherData(location: location, units: units) // Your implementation
				return .init(
					content: [.text("Weather for \(location): \(weatherData.temperature)°, \(weatherData.conditions)")],
					isError: false
				)

			case "calculator":
				if let expression = params.arguments?["expression"]?.stringValue {
					let result = evaluateExpression(expression) // Your implementation
					return .init(content: [.text("\(result)")], isError: false)
				} else {
					return .init(content: [.text("Missing expression parameter")], isError: true)
				}

			default:
				return .init(content: [.text("Unknown tool")], isError: true)
		}
	}

}
// END FILE ServerTools.swift

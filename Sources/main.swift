// SwiftFormat Header Here
// SwiftFormat Header Here

// Project: AgencyKitXCMCP (com.makememonad.AgencyKitXCMCP)
// Target: AgencyKitXCMCP (com.makememonad.AgencyKitXCMCP.AgencyKitXCMCP)
// Relevant (LINK)
// Purpose: BasicFileTemplate

import MCP

let server = Server(
    name: "XCMCP",
    version: "0.0.1",
    capabilities: .init(
	prompts: .init(listChanged: true),
	resources: .init(subscribe: true, listChanged: true),
	tools: .init(listChanged: true)
    )
)

let transport = StdioTransport()
try await server.start(transport: transport)
await registerTools(to: server)
// END FILE main.swift

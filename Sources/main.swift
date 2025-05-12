// swift-tools-version: 6.1
// BEGIN FILE main.swift
// © Gale 2025
// Swift: 6.1 | macOS: 15.4 | Xcode: 16.3
// Docs: README.md | Architecture: ARCHITECTURE.md | Style: STYLEGUIDE.md | Tasks: TODO.md | Changelog: CHANGELOG.md

// Project: AgencyKitXCMCP (com.makememonad.AgencyKitXCMCP)
// Target: AgencyKitXCMCP (com.makememonad.AgencyKitXCMCP.AgencyKitXCMCP)
// Relevant (LINK)
// Purpose: BasicFileTemplate

import MCP

let server=Server(
        name: "XCMCP",
        version: "0.0.1",
        capabilities: .init(
                prompts: .init(listChanged: true),
                resources: .init(subscribe: true, listChanged: true),
                tools: .init(listChanged: true)
        )
)

let transport=StdioTransport()
try await server.start(transport: transport)
await registerTools(to: server)
// END FILE main.swift

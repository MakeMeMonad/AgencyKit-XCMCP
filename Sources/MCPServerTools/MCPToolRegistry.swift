// swift-tools-version: 6.0
// BEGIN FILE MCPToolRegistry.swift

import Foundation
import MCP

// MARK: - MCPTool
protocol MCPTool: Sendable {
        static var definition: Tool { get }
        static func execute(arguments: [String: Value]?) async throws -> CallTool.Result
}

/// This is what ListTools will use
let allTools: [Tool]=[
        ExampleTool.definition
]

let toolRegistry=[
        "echo": ExampleTool.execute
]

// END FILE MCPToolRegistry.swift
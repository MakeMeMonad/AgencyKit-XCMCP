// swift-tools-version: 6.0
// BEGIN FILE ExampleTool.swift

import Foundation
import MCP

enum ExampleTool: MCPTool {
        // MARK: Static Computed Properties
        static var definition: Tool {
                Tool(
                        name: "minimalExample",
                        description: "An example tool which echoes a message.",
                        inputSchema: .object([
                                "location": .string("City name or coordinates"),
                                "units": .string("Units of measurement, e.g., metric, imperial")
                        ]))
        }

        // MARK: Static Functions
        static func execute(arguments: [String: Value]?) async throws -> CallTool.Result {
                let text =
                        (arguments?["text"]).flatMap {
                                if case let .string(v)=$0 { v } else { nil }
                        } ?? "Hello"
                return CallTool.Result(content: [.text(text)], isError: false)
        }
}
// END FILE ExampleTool.swift
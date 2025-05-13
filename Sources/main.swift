// swift-tools-version: 6
// BEGIN FILE mn.swift

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
await server
        .withMethodHandler(ListTools.self) { _ in ListTools.Result(tools: allTools) }
        .withMethodHandler(CallTool.self) { params in
                guard let handler=toolRegistry[params.name]
                else { throw MCPError.invalidRequest("Tool not found...") }
                return try await handler(params.arguments)
        }

// END FILE main.swift
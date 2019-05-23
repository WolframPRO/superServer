import Vapor
import HTTP

final class СelsiusController {
    
    func сelsius(_ req: Request) throws -> String {
        guard let fahrenheit = req.query[Double.self, at: "fahrenheit"] else {
            throw Abort(.badRequest)
        }
        
        return String(fahrenheit)
    }
}

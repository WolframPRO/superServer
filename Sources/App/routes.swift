import Vapor
import HTTP
import Routing

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    
    let celsiusController = Controller()
    
    router.get("celsius", use: celsiusController.greet)
    router.get("", use: celsiusController.teapot)
}

final class Controller {
    func greet(_ req: Request) throws -> String {
        guard let fahrenheit = req.query[Double.self, at: "fahrenheit"] else {
            throw Abort(.badRequest)
        }
        
        
        return "\((fahrenheit - 32.0)/1.8)"
    }
    
    func teapot(_ req: Request) throws -> String {
        throw Abort(.custom(code: 418, reasonPhrase: "I'm a teapot"))
    }
}

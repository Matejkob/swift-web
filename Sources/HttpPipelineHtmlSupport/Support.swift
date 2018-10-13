import Foundation
import Html
import HttpPipeline
import Prelude
import View

public func respond<A>(_ view: View<A>) -> Middleware<HeadersOpen, ResponseEnded, A, Data> {
  return { conn in
    conn |> respond(body: render(view.view(conn.data)), contentType: .html)
  }
}

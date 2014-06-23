if (!!!templates) var templates = {};
templates["list_item"] = new Hogan.Template({code: function (c,p,i) { var t=this;t.b(i=i||"");t.b("<li>");t.b("\n" + i);t.b("  <span>");t.b(t.v(t.f("name",c,p,0)));t.b("</span>");t.b("\n" + i);t.b("  <a class='delete-item' href='javascript:void(0);'>x</a>");t.b("\n" + i);t.b("</li>");return t.fl(); },partials: {}, subs: {  }});

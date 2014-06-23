var templates = {};
templates.list_item = new Hogan.Template(function(c,p,i){var _=this;_.b(i=i||"");_.b("<li>");_.b("\n" + i);_.b("  <span>");_.b(_.v(_.f("name",c,p,0)));_.b("</span>");_.b("\n" + i);_.b("  <a class='delete-item' href='javascript:void(0);'>x</a>");_.b("\n" + i);_.b("</li>");return _.fl();;});

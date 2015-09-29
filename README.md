# SVGSpriteView

SVGSpriteView is a subclass of `UIView` where is possible render SVG Sprites :)

In fact, SVGSpriteView is a subclass of `UIView` using `UIWebView` to load an HTML file to render SVG Sprites.

Yes! Use `UIWebView` for load an HTML file to render SVG Sprites is a workaround, but, do you think that render a `UIView` reading the path of the SVG file is less costly?

I was involved in a project where the need to use Sprite SVG was the only way out, and I resorted to writing this subclass, my friends Design applauded me, but deep and wanted to kill me to know what's going on beneath the cloth.

Good!It worked for me, so I would like to share this solution.

package template;

class Out {
	public static function write(html, name) {
		#if neko
		Sys.println('---------');
		var out = html.toString();
		Sys.println(out);
		sys.io.File.saveContent('bin/_data/${name}.html', out);
		Sys.println('---------');
		#else
		trace(html.toString());
		#end
	}
}

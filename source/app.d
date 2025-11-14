import std.stdio;

// import veritas.pkg;
import veritas.pkg;

void main()
{
	// writeln("Edit source/app.d to start your project.");
	VrtsPackage pkg = new VrtsPackage();
	pkg.localPath = "./cache/linux/";
	auto languages = pkg.identLanguages();

	int count;
	foreach(langPkg; languages) {
		count += langPkg.files.length;
	}
	writeln("Total: ", count, " files.");
	writeln();

	foreach(langPkg; languages) {
		writeln(langPkg.language.toString, ": ", langPkg.files.length, " ",cast(float)langPkg.files.length / count * 100, "%");
	}

}

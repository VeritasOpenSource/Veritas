import std.stdio;

// import veritas.pkg;
import veritas.pkg;
import veritas.db.db;
import veritas.analyzer.language;
// import veritas.analyzer.langauge;


void main()
{
	// VrtsPackage pkg = new VrtsPackage;

	// pkg.name = "linux";
	// writeln("Edit source/app.d to start your project.");
	// VrtsPackage pkg = new VrtsPackage();
	// pkg.localPath = "./cache/linux/";
	// auto languages = pkg.identLanguages();

	// int count;
	// foreach(langPkg; languages) {
	// 	count += langPkg.files.length;
	// }
	// writeln("Total: ", count, " files.");
	// writeln();

	// foreach(langPkg; languages) {
	// 	writeln(langPkg.language.toString, ": ", langPkg.files.length, " ",cast(float)langPkg.files.length / count * 100, "%");
	// }
	VrtsLocalDB db = new VrtsLocalDB;
	db.initPaths();
	// auto pkg = db.addPkg(pkg);
	auto pkg = db.getPackage("linux");
	
	LanguageAnalyzer lng = new LanguageAnalyzer();

	// lng.identLanguages(pkg);

	lng.analyze(pkg);

	writeln(pkg.name);


}

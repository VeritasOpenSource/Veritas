import std.stdio;

// import veritas.pkg;
import veritas.pkg;
import veritas.db;
import veritas.analyzer.language;
import veritas.analyzer.funcdecomposer;
// import veritas.analyzer.langauge;


void main()
{
	auto db = new VrtsAlpmBackend;
	db.sync();
	// VrtsPackage bash = new VrtsPackage();

	// bash.localPath = "../bash-5.3";

	// auto fDecomp = new VrtsFunctionDecomposer(bash);

	// fDecomp.scanFuncs();
	// // fDecomp.decompose(bash);
}

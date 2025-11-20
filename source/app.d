import std.stdio;

// import veritas.pkg;
import veritas.pkg;
import veritas.db.db;
import veritas.analyzer.language;
import veritas.funcdecomposer;
// import veritas.analyzer.langauge;


void main()
{
	VrtsPackage bash = new VrtsPackage();

	bash.localPath = "../bash-5.3";

	auto fDecomp = new VrtsFunctionDecomposer(bash);

	fDecomp.scanFuncs();
	// fDecomp.decompose(bash);
}

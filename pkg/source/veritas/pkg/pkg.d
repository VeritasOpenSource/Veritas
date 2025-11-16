module veritas.pkg.pkg;

public import veritas.pkg.lang;

import std.file;
import std.algorithm;
import std.string;
import std.stdio;
import std.path;
import std.array;
import core.sys.posix.libgen;
// import std.path;


// VrtsLanguage[] ldb;

bool isPathHidden(string path) {
	foreach(level; path.split("/")[1..$]) {
		if(level[0] == '.')
			return true;	
	}
	
	return false;
}

class VrtsPackage {
    string          name;
    // VrtsLanguageEntry[]  languages;
    string          sourceUrl;
    string          localPath;
    string          _version;
	// int filesCount;
    // VrtsFunc  functions;

    // VrtsLanguageEntry[]  identLanguages() {
    //     auto dirs = dirEntries(localPath, SpanMode.depth, false);

    //     foreach(DirEntry dir; dirs) {
    //         // write(dir.name);
	// 		if(dir.isFile()) {
	// 			if(dir.name.isPathHidden())
	// 				continue;


	// 			auto ext = extension(dir.name);
	// 			VrtsLanguage lang;
	// 			// writeln(dir.name, " ext: ", ext);
	// 			if(ext is null) {
	// 				lang = findLangByName(dir.name.baseName);
	// 			}

	// 			else {
	// 				lang = findLangByExt(ext);
	// 			}

	// 			// if(lang.caption == "Not ident") {
	// 			// 	writeln(dir.name,  " is not ident");
	// 			// 	continue;
	// 			// }
	// 			auto entry = findLangEntryByLang(languages, lang);
	// 			entry.files ~= dir.name;
	// 			filesCount++;
	// 		}
	// 	}

    //     return languages;
    // }
}


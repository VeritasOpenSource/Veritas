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


VrtsLanguage[] ldb;

bool isPathHidden(string path) {
	foreach(level; path.split("/")[1..$]) {
		if(level[0] == '.')
			return true;	
	}
	
	return false;
}

static this() {
	VrtsLanguage clang = new VrtsLanguage("C/C++", [".h", ".c", ".hpp", ".inl"]);
	VrtsLanguage rs = new VrtsLanguage("Rust", [".rs", ".rst"]);
	VrtsLanguage asmbly = new VrtsLanguage("Assembly", [".asm", ".S"]);
	VrtsLanguage shell = new VrtsLanguage("Shell", [".sh"]);
	VrtsLanguage make = new VrtsLanguage("Makefile", []);
	VrtsLanguage mk = new VrtsLanguage("mk", [".mk"]);

	VrtsLanguage none = new VrtsLanguage("None", [""]);
	VrtsLanguage notSource = new VrtsLanguage("Not source file type", []);
	

	ldb ~= clang;
	ldb ~= rs;
	ldb ~= asmbly;
	ldb ~= shell;
	ldb ~= make;
	ldb ~= mk;

	ldb ~= none;
	ldb ~= notSource;
}

VrtsLanguage findLangByExt(string ext) {
	foreach (VrtsLanguage key; ldb.filter!(a => a.fileExts.length > 0)) {	
		foreach(exts; key.fileExts) {
			// if()
			if(ext == exts)
				return key;

		}
	}

	return ldb[7];
}

VrtsLanguage findLangByName(string name) {
	foreach (VrtsLanguage key; ldb.filter!(a => a.fileExts.length == 0)) {	
		// writeln(key.caption);
		if(name == key.caption)
			return key;

	}

	return ldb[6];
}

class VrtsLanguageEntry {
	VrtsLanguage 	language;
	string[] 		files;
}

VrtsLanguageEntry findLangEntryByLang(ref VrtsLanguageEntry[] entries, VrtsLanguage lang) {
	foreach (VrtsLanguageEntry entry; entries) {
		if(entry.language is lang) {
			return entry;
		}
	}

	entries ~= new VrtsLanguageEntry();
	entries[$-1].language = lang;
	return entries[$-1];
}

class VrtsPackage {
    string          name;
    VrtsLanguageEntry[]  languages;
    string          sourceUrl;
    string          localPath;
    string          _version;
	int filesCount;
    // VrtsFunc  functions;

    VrtsLanguageEntry[]  identLanguages() {
        auto dirs = dirEntries(localPath, SpanMode.depth, false);

        foreach(DirEntry dir; dirs) {
            // write(dir.name);
			if(dir.isFile()) {
				if(dir.name.isPathHidden())
					continue;


				auto ext = extension(dir.name);
				VrtsLanguage lang;
				// writeln(dir.name, " ext: ", ext);
				if(ext is null) {
					lang = findLangByName(dir.name.baseName);
				}

				else {
					lang = findLangByExt(ext);
				}

				// if(lang.caption == "Not ident") {
				// 	writeln(dir.name,  " is not ident");
				// 	continue;
				// }
				auto entry = findLangEntryByLang(languages, lang);
				entry.files ~= dir.name;
				filesCount++;
			}
		}

        return languages;
    }
}


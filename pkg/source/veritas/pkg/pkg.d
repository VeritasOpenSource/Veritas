module veritas.pkg.pkg;

public import veritas.pkg.lang;

import std.file;
import std.algorithm;
import std.string;
import std.stdio;
import std.path;
import std.array;
import core.sys.posix.libgen;

bool isPathHidden(string path) {
	foreach(level; path.split("/")[1..$]) {
		if(level[0] == '.')
			return true;	
	}
	
	return false;
}

/**
   The main Veritas package class.
 */
class VrtsPackage {
	///Name of package
    string          name;
	///Version of package
    string          _version;
	// s
    // string          sourceUrl;
    string          localPath;
}


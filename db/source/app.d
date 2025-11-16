import std.stdio;

import std.path;
import std.file;


import veritas.pkg;

class VrtsDB {
	void loadDB();
}

class VrtsLocalDB : VrtsDB {
	string path = "./db/local/";
	string cachePath = "./cache/";

	void initPaths() {
		mkdir(path);
	}

	override void loadDB() {

	}

	void addPkg(VrtsPackage pkg) {

	}
}



void main()
{

	enum path = "./db/local/";

	writeln("Edit source/app.d to start your project.");
}

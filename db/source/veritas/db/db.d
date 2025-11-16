module veritas.db.db;

import veritas.pkg;
import std.file;

class VrtsDB {
	abstract void loadDB();
}

class VrtsLocalDB : VrtsDB {
	string path = "./db/local/";
	string cachePath = "./cache/";

	void initPaths() {
		// mkdir(path);
	}

	override void loadDB() {

	}

	void addPkg(VrtsPackage pkg) {
        mkdir(path ~ pkg.name);
	}

    VrtsPackage getPackage(string name) {
        if(isDir(path ~ name)) {
            VrtsPackage pkg = new VrtsPackage();
            pkg.name = name;
            return pkg;
        }

        return null;
    }
}

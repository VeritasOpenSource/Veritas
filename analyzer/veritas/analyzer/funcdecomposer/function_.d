module veritas.analyzer.funcdecomposer.function_;

import std.process;
import std.stdio;
import std.json;

import veritas.pkg;

// import veritas.pkg.function_;

struct VrtsFunctionVar {
    string type;
    string name;
}

class VrtsFunction {
    string name;
    VrtsFunctionVar[] args;
    string type;

    VrtsFunction[]  callers;
    VrtsFunction[]  calls;


}

class VrtsFunctionDecomposer {
    VrtsPackage pkg;

    VrtsFunction[]  funcs;

    this(VrtsPackage pkg) {
        this.pkg = pkg;
    }

    void scanFuncs() {
        string path = pkg.localPath;

        // auto res = executeShell("cd " ~ path);
        // if(res.status != 0) {
        //     writeln("ERROR");
        // }
        auto res = executeShell("ctags --output-format=json -f " ~ path ~ "/tags.json "~path~"/*.c");
        if(res.status != 0) {
            writeln("ERROR2");
        }

        // writeln("hello, world!");

        auto file = File(path ~ "/tags.json");
        foreach(line; file.byLine()) {
            // writeln(line);
            auto jsonLine = parseJSON(line);
            // if(jsonLine["_type"].str != "")
            if(jsonLine["_type"].str != "ptag" && jsonLine["kind"].str == "function")
                writeln(jsonLine["pattern"].str);
        }
    }
}
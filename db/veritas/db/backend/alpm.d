module veritas.db.backend.alpm;

import veritas.db.backend.backend;

import veritas.pkg;

import std.process;
import std.stdio;

class VrtsAlpmBackend : VrtsDBBackend {
    string path = "./sync/core.db";

    override void sync() {
        // auto res = execute([
        //     "touch",
        //     "~/veritas/db/core.db"
        //     // "https://mirror.yandex.ru/archlinux/core/os/x86_64/core.db"
        //     ]);
        // execute(program path)
        auto res = execute([
            "wget",
            "--passive-ftp",
            "-c",
            "https://mirror.yandex.ru/archlinux/core/os/x86_64/core.db",
            "--directory-prefix=./sync/db"]);

        writeln(res);
    }

    override void loadPackageInfo(string name) {

    }

    override VrtsPackage getPackage(string name) {
        return null;
    }
}
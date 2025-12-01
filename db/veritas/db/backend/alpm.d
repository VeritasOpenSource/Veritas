module veritas.db.backend.alpm;

import veritas.db.backend.backend;

import veritas.pkg;

import std.process;
import std.stdio;
import libalpmd;
// import libalpmd.db;

char* generateUrl(string treename) {
    return cast(char*)("https://mirror.yandex.ru/archlinux/" ~ treename ~ "/os/x86_64/").ptr;
}

class VrtsAlpmBackend : VrtsDBBackend {
    string url = "https://mirror.yandex.ru/archlinux/core/os/x86_64/";
    // char( urlc = )
    import std.string;
    string path = "./sync/core.db";
    import libalpmd.error;
    AlpmHandle handle;

    override void sync() {
        alpm_errno_t err;
        handle = alpm_initialize(cast(char*)"./root/".ptr, cast(char*)"./root/db/sync".ptr, &err);
        if(handle  is null) {
            throw new Exception("Handle is null");
        }

        char* urlc;
        urlc = generateUrl("core");
        AlpmDB db = handle.register_syncdb("core", ALPM_SIG_USE_DEFAULT);
        db.addServer(urlc);

        urlc = generateUrl("extra");
        db = handle.register_syncdb("extra", ALPM_SIG_USE_DEFAULT);
        db.addServer(urlc);

        urlc = generateUrl("multilib");
        db = handle.register_syncdb("multilib", ALPM_SIG_USE_DEFAULT);
        db.addServer(urlc);

        alpm_db_update(handle, handle.dbs_sync, true);
    }

    override void loadPackageInfo(string name) {

    }

    override VrtsPackage getPackage(string name) {
        return null;
    }
}
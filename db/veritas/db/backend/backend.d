module veritas.db.backend.backend;

import veritas.pkg;


interface VrtsDBBackend {
    void        sync();
    VrtsPackage getPackage(string name);
    void        loadPackageInfo(string name);
}
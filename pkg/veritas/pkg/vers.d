module veritas.pkg.vers;

/**
   The main Veritas package version struct.
 */
struct VrtsSemVer {
    uint major;
    uint minor;
    uint patch;

    this(string _str) {
        
    }
}
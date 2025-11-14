module veritas.pkg.lang;

class VrtsLanguage {
    string      caption;

    string[]    fileExts;

    this() {}

    this(string caption, string[] fileExts) {
        this.caption = caption;
        this.fileExts = fileExts;
    } 

    string[] getFileExts() {
        return fileExts.length > 0 ? fileExts : [caption];
    }

    override string toString() const @safe pure nothrow {
        return caption;    
    }
}
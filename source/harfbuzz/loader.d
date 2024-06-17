/* 
 *  Copyright © 2024, Grillo del Mal.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

module harfbuzz.loader;
import bindbc.loader;
import harfbuzz.types;
import harfbuzz.funcs;

enum HarfBuzzSupport {
    noLibrary,
    badLibrary,
    harfbuzz
}

private {
    SharedLib lib;
    HarfBuzzSupport loadedVersion;
}

@nogc nothrow:

HarfBuzzSupport loadedHarfBuzzVersion() {
    return loadedVersion;
}

bool isHarfBuzzLoaded() {
    return lib != invalidHandle;
}

HarfBuzzSupport loadHarfBuzz() {
    version (Windows) {
        const(char)[][1] libNames =
            [
                "harfbuzz.dll"
            ];
    } else version (OSX) {
        const(char)[][1] libNames =
            [
                "libharfbuzz.dylib"
            ];
    } else version (Posix) {
        const(char)[][3] libNames =
            [
                "libharfbuzz.so",
                "libharfbuzz.so.0",
                "/usr/local/lib/libharfbuzz.so",
            ];
    } else
        static assert(0, "libcairo is not yet supported on this platform.");

    HarfBuzzSupport ret;
    foreach (name; libNames) {
        ret = loadHarfBuzz(name.ptr);
        if (ret != HarfBuzzSupport.noLibrary)
            break;
    }
    return ret;
}

HarfBuzzSupport loadHarfBuzz(const(char)* libName) {
    lib = load(libName);
    if (lib == invalidHandle) {
        return HarfBuzzSupport.noLibrary;
    }

    int loaded;
    loadedVersion = HarfBuzzSupport.badLibrary;
    import std.algorithm.searching : startsWith;

    static foreach (m; [
            __traits(allMembers, harfbuzz.funcs.hb.blob),
            __traits(allMembers, harfbuzz.funcs.hb.buffer),
            __traits(allMembers, harfbuzz.funcs.hb.common),
            __traits(allMembers, harfbuzz.funcs.hb.deprecated_),
            __traits(allMembers, harfbuzz.funcs.hb.draw),
            __traits(allMembers, harfbuzz.funcs.hb.face),
            __traits(allMembers, harfbuzz.funcs.hb.font),
            __traits(allMembers, harfbuzz.funcs.hb.map),
            __traits(allMembers, harfbuzz.funcs.hb.paint),
            __traits(allMembers, harfbuzz.funcs.hb.set),
            __traits(allMembers, harfbuzz.funcs.hb.shape),
            __traits(allMembers, harfbuzz.funcs.hb.shape_plan),
            __traits(allMembers, harfbuzz.funcs.hb.style),
            __traits(allMembers, harfbuzz.funcs.hb.unicode),
            __traits(allMembers, harfbuzz.funcs.hb.version_),
            ]) {
        static if (m.startsWith("hb_")) {
            lib.bindSymbol(
                cast(void**)&__traits(getMember, harfbuzz.funcs, m),
                __traits(getMember, harfbuzz.funcs, m).stringof
            );
            loaded++;
        }
    }

    loaded -= errorCount();
    if (loaded <= 0)
        return HarfBuzzSupport.badLibrary;

    loadedVersion = HarfBuzzSupport.harfbuzz;
    return loadedVersion;
}

void unloadHarfBuzz() {
    unload(lib);
    lib = invalidHandle;
    
    import std.algorithm.searching : startsWith;
    static foreach (m; [
            __traits(allMembers, harfbuzz.funcs.hb.blob),
            __traits(allMembers, harfbuzz.funcs.hb.buffer),
            __traits(allMembers, harfbuzz.funcs.hb.common),
            __traits(allMembers, harfbuzz.funcs.hb.deprecated_),
            __traits(allMembers, harfbuzz.funcs.hb.draw),
            __traits(allMembers, harfbuzz.funcs.hb.face),
            __traits(allMembers, harfbuzz.funcs.hb.font),
            __traits(allMembers, harfbuzz.funcs.hb.map),
            __traits(allMembers, harfbuzz.funcs.hb.paint),
            __traits(allMembers, harfbuzz.funcs.hb.set),
            __traits(allMembers, harfbuzz.funcs.hb.shape),
            __traits(allMembers, harfbuzz.funcs.hb.shape_plan),
            __traits(allMembers, harfbuzz.funcs.hb.style),
            __traits(allMembers, harfbuzz.funcs.hb.unicode),
            __traits(allMembers, harfbuzz.funcs.hb.version_),
            ]) {
        static if (m.startsWith("hb_")) {
            __traits(getMember, harfbuzz.funcs, m) = null;
        }
    }
}

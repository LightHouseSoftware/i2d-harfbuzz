/*
 * Adapted from hb-version.h by Grillo del Mal
 *
 * Copyright © 2011  Google, Inc.
 *
 *  This is part of HarfBuzz, a text shaping library.
 *
 * Permission is hereby granted, without written agreement and without
 * license or royalty fees, to use, copy, modify, and distribute this
 * software and its documentation for any purpose, provided that the
 * above copyright notice and the following two paragraphs appear in
 * all copies of this software.
 *
 * IN NO EVENT SHALL THE COPYRIGHT HOLDER BE LIABLE TO ANY PARTY FOR
 * DIRECT, INDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES
 * ARISING OUT OF THE USE OF THIS SOFTWARE AND ITS DOCUMENTATION, EVEN
 * IF THE COPYRIGHT HOLDER HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH
 * DAMAGE.
 *
 * THE COPYRIGHT HOLDER SPECIFICALLY DISCLAIMS ANY WARRANTIES, INCLUDING,
 * BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
 * FITNESS FOR A PARTICULAR PURPOSE.  THE SOFTWARE PROVIDED HEREUNDER IS
 * ON AN "AS IS" BASIS, AND THE COPYRIGHT HOLDER HAS NO OBLIGATION TO
 * PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS.
 *
 * Google Author(s): Behdad Esfahbod
 */

 module harfbuzz.hb.version_;

import harfbuzz.hb.common;

nothrow @nogc:
extern (C):


/**
 * HB_VERSION_MAJOR:
 *
 * The major component of the library version available at compile-time.
 */
enum HB_VERSION_MAJOR = 8;
/**
 * HB_VERSION_MINOR:
 *
 * The minor component of the library version available at compile-time.
 */
enum HB_VERSION_MINOR = 4;
/**
 * HB_VERSION_MICRO:
 *
 * The micro component of the library version available at compile-time.
 */
enum HB_VERSION_MICRO = 0;

/**
 * HB_VERSION_STRING:
 *
 * A string literal containing the library version available at compile-time.
 */
enum HB_VERSION_STRING = "8.4.0";

/**
 * HB_VERSION_ATLEAST:
 * @major: the major component of the version number
 * @minor: the minor component of the version number
 * @micro: the micro component of the version number
 *
 * Tests the library version at compile-time against a minimum value,
 * as three integer components.
 */
bool HB_VERSION_ATLEAST(uint major, uint minor, uint micro) {
    return ((major)*10000+(minor)*100+(micro) <= 
    	HB_VERSION_MAJOR*10000+HB_VERSION_MINOR*100+HB_VERSION_MICRO);
}

__gshared {
    void
    function (
            uint *major,
            uint *minor,
            uint *micro)
        hb_version;

    const char *
    function ()
        hb_version_string;

    hb_bool_t
    function (
            uint major,
            uint minor,
            uint micro)
        hb_version_atleast;
}

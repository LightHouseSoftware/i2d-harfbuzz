/*
 * Adapted from hb-common.h by Grillo del Mal
 *
 * Copyright © 2007,2008,2009  Red Hat, Inc.
 * Copyright © 2011,2012  Google, Inc.
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
 * Red Hat Author(s): Behdad Esfahbod
 * Google Author(s): Behdad Esfahbod
 */
 
module harfbuzz.funcs.hb.common;
import harfbuzz.types.hb.common;

nothrow @nogc:
extern (C):

__gshared {

    /* len=-1 means str is NUL-terminated. */
    hb_tag_t
    function (const char *str, int len)
        hb_tag_from_string;

    /* buf should have 4 bytes. */
    void
    function (hb_tag_t tag, char *buf)
        hb_tag_to_string;

    /* len=-1 means str is NUL-terminated */
    hb_direction_t
    function (const char *str, int len)
        hb_direction_from_string;

    //FIXME: const char *
    char *
    function (hb_direction_t direction)
        hb_direction_to_string;

    hb_language_t
    function (const char *str, int len)
        hb_language_from_string;

    //FIXME: char *
    char *
    function (hb_language_t language)
        hb_language_to_string;

    hb_language_t
    function ()
        hb_language_get_default;

    hb_bool_t
    function (
            hb_language_t language,
            hb_language_t specific)
        hb_language_matches;

    hb_script_t
    function (hb_tag_t tag)
        hb_script_from_iso15924_tag;

    hb_script_t
    function (const char *str, int len)
        hb_script_from_string;

    hb_tag_t
    function (hb_script_t script)
        hb_script_to_iso15924_tag;

    hb_direction_t
    function (hb_script_t script)
        hb_script_get_horizontal_direction;

    hb_bool_t
    function (
            const char *str, int len,
            hb_feature_t *feature) 
        hb_feature_from_string;

    void
    function (
            hb_feature_t *feature,
            char *buf, uint size) 
        hb_feature_to_string;

    hb_bool_t
    function (
            const char *str, int len,
            hb_variation_t *variation)
        hb_variation_from_string;

    void
    function (
            hb_variation_t *variation,
            char *buf, uint size)
        hb_variation_to_string;
}

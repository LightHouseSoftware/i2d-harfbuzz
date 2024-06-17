/*
 * Adapted from hb-deprecated.h by Grillo del Mal
 *
 * Copyright © 2013  Google, Inc.
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

module harfbuzz.funcs.hb.deprecated_;
import harfbuzz.types.hb.deprecated_;

//import harfbuzz.hb.common;
//import harfbuzz.hb.unicode;
//import harfbuzz.hb.font;
//import harfbuzz.hb.set;

version(HB_ENABLE_DEPRECATED):

nothrow @nogc:
extern (C):

__gshared {
    void
    function (
            hb_font_funcs_t *ffuncs,
            hb_font_get_glyph_func_t func,
            void *user_data, hb_destroy_func_t destroy)
        hb_font_funcs_set_glyph_func;

    void
    function (
            hb_unicode_funcs_t *ufuncs,
            hb_unicode_eastasian_width_func_t func,
            void *user_data, hb_destroy_func_t destroy)
        hb_unicode_funcs_set_eastasian_width_func;

    uint
    function (
            hb_unicode_funcs_t *ufuncs,
            hb_codepoint_t unicode)
        hb_unicode_eastasian_width;

    void
    function (
            hb_unicode_funcs_t *ufuncs,
            hb_unicode_decompose_compatibility_func_t func,
            void *user_data, hb_destroy_func_t destroy)
        hb_unicode_funcs_set_decompose_compatibility_func;

    uint
    function (
            hb_unicode_funcs_t *ufuncs,
            hb_codepoint_t      u,
            hb_codepoint_t     *decomposed)
        hb_unicode_decompose_compatibility;

    void
    function (
            hb_font_funcs_t *ffuncs,
            hb_font_get_glyph_v_kerning_func_t func,
            void *user_data, hb_destroy_func_t destroy)
        hb_font_funcs_set_glyph_v_kerning_func;

    hb_position_t
    function (
            hb_font_t *font,
            hb_codepoint_t top_glyph, hb_codepoint_t bottom_glyph)
        hb_font_get_glyph_v_kerning;

    void
    function (
            hb_font_funcs_t *ffuncs,
            hb_font_get_glyph_shape_func_t func,
            void *user_data, hb_destroy_func_t destroy)
        hb_font_funcs_set_glyph_shape_func;

    void
    function (
            hb_font_t *font,
            hb_codepoint_t glyph,
            hb_draw_funcs_t *dfuncs, void *draw_data)
        hb_font_get_glyph_shape;
}

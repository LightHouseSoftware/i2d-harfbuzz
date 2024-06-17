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

module harfbuzz.types.hb.deprecated_;

import harfbuzz.types.hb.common;
import harfbuzz.types.hb.unicode;
import harfbuzz.types.hb.font;
import harfbuzz.types.hb.set;

version(HB_ENABLE_DEPRECATED):

nothrow @nogc:
extern (C):


/**
 * HB_SCRIPT_CANADIAN_ABORIGINAL:
 *
 * Use #HB_SCRIPT_CANADIAN_SYLLABICS instead.
 *
 * Deprecated: 0.9.20
 */
alias HB_SCRIPT_CANADIAN_ABORIGINAL	= HB_SCRIPT_CANADIAN_SYLLABICS;

/**
 * HB_BUFFER_FLAGS_DEFAULT:
 *
 * Use #HB_BUFFER_FLAG_DEFAULT instead.
 *
 * Deprecated: 0.9.20
 */
alias HB_BUFFER_FLAGS_DEFAULT = HB_BUFFER_FLAG_DEFAULT;
/**
 * HB_BUFFER_SERIALIZE_FLAGS_DEFAULT:
 *
 * Use #HB_BUFFER_SERIALIZE_FLAG_DEFAULT instead.
 *
 * Deprecated: 0.9.20
 */
alias HB_BUFFER_SERIALIZE_FLAGS_DEFAULT = HB_BUFFER_SERIALIZE_FLAG_DEFAULT;

/**
 * hb_font_get_glyph_func_t:
 * @font: #hb_font_t to work upon
 * @font_data: @font user data pointer
 * @unicode: The Unicode code point to query
 * @variation_selector: The  variation-selector code point to query
 * @glyph: (out): The glyph ID retrieved
 * @user_data: User data pointer passed by the caller
 *
 * A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
 *
 * This method should retrieve the glyph ID for a specified Unicode code point
 * font, with an optional variation selector.
 *
 * Return value: `true` if data found, `false` otherwise
 * Deprecated: 1.2.3
 *
 **/
alias hb_font_get_glyph_func_t = 
    hb_bool_t 
    function (
            hb_font_t *font, void *font_data,
            hb_codepoint_t unicode, hb_codepoint_t variation_selector,
            hb_codepoint_t *glyph,
            void *user_data);

/* https://github.com/harfbuzz/harfbuzz/pull/4207 */
/**
 * HB_UNICODE_COMBINING_CLASS_CCC133:
 *
 * [Tibetan]
 *
 * Deprecated: 7.2.0
 **/
enum HB_UNICODE_COMBINING_CLASS_CCC133 = 133;

/**
 * hb_unicode_eastasian_width_func_t:
 * @ufuncs: A Unicode-functions structure
 * @unicode: The code point to query
 * @user_data: User data pointer passed by the caller
 *
 * A virtual method for the #hb_unicode_funcs_t structure.
 *
 * Deprecated: 2.0.0
 */
alias hb_unicode_eastasian_width_func_t = 
    uint 
    function (
            hb_unicode_funcs_t *ufuncs,
            hb_codepoint_t      unicode,
            void               *user_data);

/**
 * hb_unicode_funcs_set_eastasian_width_func:
 * @ufuncs: a Unicode-function structure
 * @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
 * @user_data: Data to pass to @func
 * @destroy: (nullable): The function to call when @user_data is not needed anymore
 *
 * Sets the implementation function for #hb_unicode_eastasian_width_func_t.
 *
 * Since: 0.9.2
 * Deprecated: 2.0.0
 **/

/**
 * hb_unicode_eastasian_width:
 * @ufuncs: a Unicode-function structure
 * @unicode: The code point to query
 *
 * Don't use. Not used by HarfBuzz.
 *
 * Since: 0.9.2
 * Deprecated: 2.0.0
 **/

/**
 * hb_unicode_decompose_compatibility_func_t:
 * @ufuncs: a Unicode function structure
 * @u: codepoint to decompose
 * @decomposed: address of codepoint array (of length #HB_UNICODE_MAX_DECOMPOSITION_LEN) to write decomposition into
 * @user_data: user data pointer as passed to hb_unicode_funcs_set_decompose_compatibility_func()
 *
 * Fully decompose @u to its Unicode compatibility decomposition. The codepoints of the decomposition will be written to @decomposed.
 * The complete length of the decomposition will be returned.
 *
 * If @u has no compatibility decomposition, zero should be returned.
 *
 * The Unicode standard guarantees that a buffer of length #HB_UNICODE_MAX_DECOMPOSITION_LEN codepoints will always be sufficient for any
 * compatibility decomposition plus an terminating value of 0.  Consequently, @decompose must be allocated by the caller to be at least this length.  Implementations
 * of this function type must ensure that they do not write past the provided array.
 *
 * Return value: number of codepoints in the full compatibility decomposition of @u, or 0 if no decomposition available.
 *
 * Deprecated: 2.0.0
 */
alias hb_unicode_decompose_compatibility_func_t = 
    uint 
    function (
            hb_unicode_funcs_t *ufuncs,
            hb_codepoint_t      u,
            hb_codepoint_t     *decomposed,
            void               *user_data);

/**
 * HB_UNICODE_MAX_DECOMPOSITION_LEN:
 *
 * See Unicode 6.1 for details on the maximum decomposition length.
 *
 * Deprecated: 2.0.0
 */
enum HB_UNICODE_MAX_DECOMPOSITION_LEN = (18+1); /* codepoints */

/**
 * hb_unicode_funcs_set_decompose_compatibility_func:
 * @ufuncs: A Unicode-functions structure
 * @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
 * @user_data: Data to pass to @func
 * @destroy: (nullable): The function to call when @user_data is not needed anymore
 *
 * Sets the implementation function for #hb_unicode_decompose_compatibility_func_t.
 *
 * 
 *
 * Since: 0.9.2
 * Deprecated: 2.0.0
 **/

/**
 * hb_font_get_glyph_v_kerning_func_t:
 *
 * A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
 *
 * This method should retrieve the kerning-adjustment value for a glyph-pair in
 * the specified font, for vertical text segments.
 *
 **/
alias hb_font_get_glyph_v_kerning_func_t = hb_font_get_glyph_kerning_func_t;

/**
 * hb_font_funcs_set_glyph_v_kerning_func:
 * @ffuncs: A font-function structure
 * @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
 * @user_data: Data to pass to @func
 * @destroy: (nullable): The function to call when @user_data is not needed anymore
 *
 * Sets the implementation function for #hb_font_get_glyph_v_kerning_func_t.
 *
 * Since: 0.9.2
 * Deprecated: 2.0.0
 **/

/**
 * hb_font_get_glyph_shape_func_t:
 * @font: #hb_font_t to work upon
 * @font_data: @font user data pointer
 * @glyph: The glyph ID to query
 * @draw_funcs: The draw functions to send the shape data to
 * @draw_data: The data accompanying the draw functions
 * @user_data: User data pointer passed by the caller
 *
 * A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
 *
 * Since: 4.0.0
 * Deprecated: 7.0.0: Use #hb_font_draw_glyph_func_t instead
 **/
alias hb_font_get_glyph_shape_func_t =
    void
    function (
            hb_font_t *font, void *font_data,
            hb_codepoint_t glyph,
            hb_draw_funcs_t *draw_funcs, void *draw_data,
            void *user_data);

/**
 * hb_font_funcs_set_glyph_shape_func:
 * @ffuncs: A font-function structure
 * @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
 * @user_data: Data to pass to @func
 * @destroy: (nullable): The function to call when @user_data is not needed anymore
 *
 * Sets the implementation function for #hb_font_get_glyph_shape_func_t,
 * which is the same as #hb_font_draw_glyph_func_t.
 *
 * Since: 4.0.0
 * Deprecated: 7.0.0: Use hb_font_funcs_set_draw_glyph_func() instead
 **/

/**
 * HB_AAT_LAYOUT_FEATURE_TYPE_CURISVE_CONNECTION:
 *
 * Use #HB_AAT_LAYOUT_FEATURE_TYPE_CURSIVE_CONNECTION instead.
 *
 * Deprecated: 8.3.0
 */
alias HB_AAT_LAYOUT_FEATURE_TYPE_CURISVE_CONNECTION = HB_AAT_LAYOUT_FEATURE_TYPE_CURSIVE_CONNECTION;

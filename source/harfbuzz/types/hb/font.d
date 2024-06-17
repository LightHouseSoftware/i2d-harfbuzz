/*
 * Adapted from hb-font.h by Grillo del Mal
 *
 * Copyright © 2009  Red Hat, Inc.
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
 */


module harfbuzz.types.hb.font;

import harfbuzz.types.hb.common;
import harfbuzz.types.hb.face;
import harfbuzz.types.hb.draw;
import harfbuzz.types.hb.paint;

nothrow @nogc:
extern (C):

/*
 * hb_font_funcs_t
 */

/**
 * hb_font_funcs_t:
 *
 * Data type containing a set of virtual methods used for
 * working on #hb_font_t font objects.
 *
 * HarfBuzz provides a lightweight default function for each of 
 * the methods in #hb_font_funcs_t. Client programs can implement
 * their own replacements for the individual font functions, as
 * needed, and replace the default by calling the setter for a
 * method.
 *
 **/
struct hb_font_funcs_t;

/* font extents */

/**
 * hb_font_extents_t:
 * @ascender: The height of typographic ascenders.
 * @descender: The depth of typographic descenders.
 * @line_gap: The suggested line-spacing gap.
 *
 * Font-wide extent values, measured in font units.
 *
 * Note that typically @ascender is positive and @descender
 * negative, in coordinate systems that grow up.
 **/
struct hb_font_extents_t {
  hb_position_t ascender;
  hb_position_t descender;
  hb_position_t line_gap;
  /*< private >*/
  hb_position_t reserved9;
  hb_position_t reserved8;
  hb_position_t reserved7;
  hb_position_t reserved6;
  hb_position_t reserved5;
  hb_position_t reserved4;
  hb_position_t reserved3;
  hb_position_t reserved2;
  hb_position_t reserved1;
}

/* func types */

/**
 * hb_font_get_font_extents_func_t:
 * @font: #hb_font_t to work upon
 * @font_data: @font user data pointer
 * @extents: (out): The font extents retrieved
 * @user_data: User data pointer passed by the caller
 *
 * This method should retrieve the extents for a font.
 *
 **/
alias hb_font_get_font_extents_func_t = 
    hb_bool_t function (
            hb_font_t *font, void *font_data,
            hb_font_extents_t *extents,
            void *user_data);

/**
 * hb_font_get_font_h_extents_func_t:
 *
 * A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
 *
 * This method should retrieve the extents for a font, for horizontal-direction
 * text segments. Extents must be returned in an #hb_glyph_extents output
 * parameter.
 * 
 **/
alias hb_font_get_font_h_extents_func_t = hb_font_get_font_extents_func_t;

/**
 * hb_font_get_font_v_extents_func_t:
 *
 * A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
 *
 * This method should retrieve the extents for a font, for vertical-direction
 * text segments. Extents must be returned in an #hb_glyph_extents output
 * parameter.
 * 
 **/
alias hb_font_get_font_v_extents_func_t = hb_font_get_font_extents_func_t;


/**
 * hb_font_get_nominal_glyph_func_t:
 * @font: #hb_font_t to work upon
 * @font_data: @font user data pointer
 * @unicode: The Unicode code point to query
 * @glyph: (out): The glyph ID retrieved
 * @user_data: User data pointer passed by the caller
 *
 * A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
 *
 * This method should retrieve the nominal glyph ID for a specified Unicode code
 * point. Glyph IDs must be returned in a #hb_codepoint_t output parameter.
 * 
 * Return value: `true` if data found, `false` otherwise
 *
 **/
alias hb_font_get_nominal_glyph_func_t = 
    hb_bool_t 
    function (
            hb_font_t *font, void *font_data,
            hb_codepoint_t unicode,
            hb_codepoint_t *glyph,
            void *user_data);

/**
 * hb_font_get_variation_glyph_func_t:
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
 * followed by a specified Variation Selector code point. Glyph IDs must be
 * returned in a #hb_codepoint_t output parameter.
 * 
 * Return value: `true` if data found, `false` otherwise
 *
 **/
alias hb_font_get_variation_glyph_func_t = 
    hb_bool_t 
    function (
            hb_font_t *font, void *font_data,
            hb_codepoint_t unicode, hb_codepoint_t variation_selector,
            hb_codepoint_t *glyph,
            void *user_data);


/**
 * hb_font_get_nominal_glyphs_func_t:
 * @font: #hb_font_t to work upon
 * @font_data: @font user data pointer
 * @count: number of code points to query
 * @first_unicode: The first Unicode code point to query
 * @unicode_stride: The stride between successive code points
 * @first_glyph: (out): The first glyph ID retrieved
 * @glyph_stride: The stride between successive glyph IDs
 * @user_data: User data pointer passed by the caller
 *
 * A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
 *
 * This method should retrieve the nominal glyph IDs for a sequence of
 * Unicode code points. Glyph IDs must be returned in a #hb_codepoint_t
 * output parameter.
 *
 * Return value: the number of code points processed
 * 
 **/
alias hb_font_get_nominal_glyphs_func_t = 
    uint 
    function (
            hb_font_t *font, void *font_data,
            uint count,
            const hb_codepoint_t *first_unicode,
            uint unicode_stride,
            hb_codepoint_t *first_glyph,
            uint glyph_stride,
            void *user_data);

/**
 * hb_font_get_glyph_advance_func_t:
 * @font: #hb_font_t to work upon
 * @font_data: @font user data pointer
 * @glyph: The glyph ID to query
 * @user_data: User data pointer passed by the caller
 *
 * A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
 *
 * This method should retrieve the advance for a specified glyph. The
 * method must return an #hb_position_t.
 * 
 * Return value: The advance of @glyph within @font
 *
 **/
alias hb_font_get_glyph_advance_func_t = 
    hb_position_t 
    function (
            hb_font_t *font, void *font_data,
            hb_codepoint_t glyph,
            void *user_data);

/**
 * hb_font_get_glyph_h_advance_func_t:
 *
 * A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
 *
 * This method should retrieve the advance for a specified glyph, in
 * horizontal-direction text segments. Advances must be returned in
 * an #hb_position_t output parameter.
 * 
 **/
alias hb_font_get_glyph_h_advance_func_t = hb_font_get_glyph_advance_func_t;

/**
 * hb_font_get_glyph_v_advance_func_t:
 *
 * A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
 *
 * This method should retrieve the advance for a specified glyph, in
 * vertical-direction text segments. Advances must be returned in
 * an #hb_position_t output parameter.
 * 
 **/
alias hb_font_get_glyph_v_advance_func_t = hb_font_get_glyph_advance_func_t;

/**
 * hb_font_get_glyph_advances_func_t:
 * @font: #hb_font_t to work upon
 * @font_data: @font user data pointer
 * @count: The number of glyph IDs in the sequence queried
 * @first_glyph: The first glyph ID to query
 * @glyph_stride: The stride between successive glyph IDs
 * @first_advance: (out): The first advance retrieved
 * @advance_stride: The stride between successive advances
 * @user_data: User data pointer passed by the caller
 *
 * A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
 *
 * This method should retrieve the advances for a sequence of glyphs.
 * 
 **/
//FIXME?: unsigned?
alias hb_font_get_glyph_advances_func_t = 
    void 
    function (
            hb_font_t* font, void* font_data,
            uint count,
            const hb_codepoint_t *first_glyph,
            uint glyph_stride,
            hb_position_t *first_advance,
            uint advance_stride,
            void *user_data);

/**
 * hb_font_get_glyph_h_advances_func_t:
 *
 * A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
 *
 * This method should retrieve the advances for a sequence of glyphs, in
 * horizontal-direction text segments.
 * 
 **/
alias hb_font_get_glyph_h_advances_func_t = hb_font_get_glyph_advances_func_t;

/**
 * hb_font_get_glyph_v_advances_func_t:
 *
 * A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
 *
 * This method should retrieve the advances for a sequence of glyphs, in
 * vertical-direction text segments.
 * 
 **/
alias hb_font_get_glyph_v_advances_func_t = hb_font_get_glyph_advances_func_t;

/**
 * hb_font_get_glyph_origin_func_t:
 * @font: #hb_font_t to work upon
 * @font_data: @font user data pointer
 * @glyph: The glyph ID to query
 * @x: (out): The X coordinate of the origin
 * @y: (out): The Y coordinate of the origin
 * @user_data: User data pointer passed by the caller
 *
 * A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
 *
 * This method should retrieve the (X,Y) coordinates (in font units) of the
 * origin for a glyph. Each coordinate must be returned in an #hb_position_t
 * output parameter.
 *
 * Return value: `true` if data found, `false` otherwise
 * 
 **/
alias hb_font_get_glyph_origin_func_t = 
    hb_bool_t
    function (
            hb_font_t *font, void *font_data,
            hb_codepoint_t glyph,
            hb_position_t *x, hb_position_t *y,
            void *user_data);

/**
 * hb_font_get_glyph_h_origin_func_t:
 *
 * A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
 *
 * This method should retrieve the (X,Y) coordinates (in font units) of the
 * origin for a glyph, for horizontal-direction text segments. Each
 * coordinate must be returned in an #hb_position_t output parameter.
 * 
 **/
alias hb_font_get_glyph_h_origin_func_t = hb_font_get_glyph_origin_func_t;

/**
 * hb_font_get_glyph_v_origin_func_t:
 *
 * A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
 *
 * This method should retrieve the (X,Y) coordinates (in font units) of the
 * origin for a glyph, for vertical-direction text segments. Each coordinate
 * must be returned in an #hb_position_t output parameter.
 * 
 **/
alias hb_font_get_glyph_v_origin_func_t = hb_font_get_glyph_origin_func_t;

/**
 * hb_font_get_glyph_kerning_func_t:
 * @font: #hb_font_t to work upon
 * @font_data: @font user data pointer
 * @first_glyph: The glyph ID of the first glyph in the glyph pair
 * @second_glyph: The glyph ID of the second glyph in the glyph pair
 * @user_data: User data pointer passed by the caller
 *
 * This method should retrieve the kerning-adjustment value for a glyph-pair in
 * the specified font, for horizontal text segments.
 *
 **/
alias hb_font_get_glyph_kerning_func_t = 
    hb_position_t 
    function (
            hb_font_t *font, void *font_data,
            hb_codepoint_t first_glyph, hb_codepoint_t second_glyph,
            void *user_data);
/**
 * hb_font_get_glyph_h_kerning_func_t:
 *
 * A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
 *
 * This method should retrieve the kerning-adjustment value for a glyph-pair in
 * the specified font, for horizontal text segments.
 *
 **/
alias hb_font_get_glyph_h_kerning_func_t = hb_font_get_glyph_kerning_func_t;


/**
 * hb_font_get_glyph_extents_func_t:
 * @font: #hb_font_t to work upon
 * @font_data: @font user data pointer
 * @glyph: The glyph ID to query
 * @extents: (out): The #hb_glyph_extents_t retrieved
 * @user_data: User data pointer passed by the caller
 *
 * A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
 *
 * This method should retrieve the extents for a specified glyph. Extents must be 
 * returned in an #hb_glyph_extents output parameter.
 *
 * Return value: `true` if data found, `false` otherwise
 * 
 **/
alias hb_font_get_glyph_extents_func_t = 
    hb_bool_t 
    function (
            hb_font_t *font, void *font_data,
            hb_codepoint_t glyph,
            hb_glyph_extents_t *extents,
            void *user_data);

/**
 * hb_font_get_glyph_contour_point_func_t:
 * @font: #hb_font_t to work upon
 * @font_data: @font user data pointer
 * @glyph: The glyph ID to query
 * @point_index: The contour-point index to query
 * @x: (out): The X value retrieved for the contour point
 * @y: (out): The Y value retrieved for the contour point
 * @user_data: User data pointer passed by the caller
 *
 * A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
 *
 * This method should retrieve the (X,Y) coordinates (in font units) for a
 * specified contour point in a glyph. Each coordinate must be returned as
 * an #hb_position_t output parameter.
 * 
 * Return value: `true` if data found, `false` otherwise
 *
 **/
alias hb_font_get_glyph_contour_point_func_t =
    hb_bool_t function (
            hb_font_t *font, void *font_data,
            hb_codepoint_t glyph, uint point_index,
            hb_position_t *x, hb_position_t *y,
            void *user_data);


/**
 * hb_font_get_glyph_name_func_t:
 * @font: #hb_font_t to work upon
 * @font_data: @font user data pointer
 * @glyph: The glyph ID to query
 * @name: (out) (array length=size): Name string retrieved for the glyph ID
 * @size: Length of the glyph-name string retrieved
 * @user_data: User data pointer passed by the caller
 *
 * A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
 *
 * This method should retrieve the glyph name that corresponds to a
 * glyph ID. The name should be returned in a string output parameter.
 * 
 * Return value: `true` if data found, `false` otherwise
 *
 **/
alias hb_font_get_glyph_name_func_t = 
    hb_bool_t 
    function (
            hb_font_t *font, void *font_data,
            hb_codepoint_t glyph,
            char *name, uint size,
            void *user_data);

/**
 * hb_font_get_glyph_from_name_func_t:
 * @font: #hb_font_t to work upon
 * @font_data: @font user data pointer
 * @name: (array length=len): The name string to query
 * @len: The length of the name queried
 * @glyph: (out): The glyph ID retrieved
 * @user_data: User data pointer passed by the caller
 *
 * A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
 *
 * This method should retrieve the glyph ID that corresponds to a glyph-name
 * string. 
 * 
 * Return value: `true` if data found, `false` otherwise
 *
 **/
alias hb_font_get_glyph_from_name_func_t = 
    hb_bool_t 
    function (
            hb_font_t *font, void *font_data,
            const char *name, int len, /* -1 means nul-terminated */
            hb_codepoint_t *glyph,
            void *user_data);

/**
 * hb_font_draw_glyph_func_t:
 * @font: #hb_font_t to work upon
 * @font_data: @font user data pointer
 * @glyph: The glyph ID to query
 * @draw_funcs: The draw functions to send the shape data to
 * @draw_data: The data accompanying the draw functions
 * @user_data: User data pointer passed by the caller
 *
 * A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
 *
 * Since: 7.0.0
 *
 **/
alias hb_font_draw_glyph_func_t = 
    void 
    function (
            hb_font_t *font, void *font_data,
            hb_codepoint_t glyph,
            hb_draw_funcs_t *draw_funcs, void *draw_data,
            void *user_data);

/**
 * hb_font_paint_glyph_func_t:
 * @font: #hb_font_t to work upon
 * @font_data: @font user data pointer
 * @glyph: The glyph ID to query
 * @paint_funcs: The paint functions to use
 * @paint_data: The data accompanying the paint functions
 * @palette_index: The color palette to use
 * @foreground: The foreground color
 * @user_data: User data pointer passed by the caller
 *
 * A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
 *
 * Since: 7.0.0
 */
alias hb_font_paint_glyph_func_t = 
    void function (
            hb_font_t *font, void *font_data,
            hb_codepoint_t glyph,
            hb_paint_funcs_t *paint_funcs, void *paint_data,
            uint palette_index,
            hb_color_t foreground,
            void *user_data);

/**
 * HB_FONT_NO_VAR_NAMED_INSTANCE:
 *
 * Constant signifying that a font does not have any
 * named-instance index set.  This is the default of
 * a font.
 *
 * Since: 7.0.0
 */
enum HB_FONT_NO_VAR_NAMED_INSTANCE = 0xFFFFFFFF;

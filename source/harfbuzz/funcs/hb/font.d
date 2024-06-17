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


module harfbuzz.funcs.hb.font;
import harfbuzz.types.hb.font;

import harfbuzz.types.hb.common;
import harfbuzz.types.hb.face;
import harfbuzz.types.hb.draw;
import harfbuzz.types.hb.paint;

nothrow @nogc:
extern (C):

__gshared {
    hb_font_funcs_t *
    function ()
        hb_font_funcs_create;

    hb_font_funcs_t *
    function ()
        hb_font_funcs_get_empty;

    hb_font_funcs_t *
    function (hb_font_funcs_t *ffuncs)
        hb_font_funcs_reference;

    void
    function (hb_font_funcs_t *ffuncs)
        hb_font_funcs_destroy;

    hb_bool_t
    function (
            hb_font_funcs_t    *ffuncs,
            hb_user_data_key_t *key,
            void *              data,
            hb_destroy_func_t   destroy,
            hb_bool_t           replace)
        hb_font_funcs_set_user_data;


    void *
    function (
            const hb_font_funcs_t *ffuncs,
            hb_user_data_key_t    *key)
        hb_font_funcs_get_user_data;


    void
    function (hb_font_funcs_t *ffuncs)
        hb_font_funcs_make_immutable;

    hb_bool_t
    function (hb_font_funcs_t *ffuncs)
        hb_font_funcs_is_immutable;

    /* func setters */

    /**
    * hb_font_funcs_set_font_h_extents_func:
    * @ffuncs: A font-function structure
    * @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
    * @user_data: Data to pass to @func
    * @destroy: (nullable): The function to call when @user_data is not needed anymore
    *
    * Sets the implementation function for #hb_font_get_font_h_extents_func_t.
    *
    * Since: 1.1.2
    **/
    void
    function (
            hb_font_funcs_t *ffuncs,
            hb_font_get_font_h_extents_func_t func,
            void *user_data, hb_destroy_func_t destroy)
        hb_font_funcs_set_font_h_extents_func;

    /**
    * hb_font_funcs_set_font_v_extents_func:
    * @ffuncs: A font-function structure
    * @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
    * @user_data: Data to pass to @func
    * @destroy: (nullable): The function to call when @user_data is not needed anymore
    *
    * Sets the implementation function for #hb_font_get_font_v_extents_func_t.
    *
    * Since: 1.1.2
    **/
    void
    function (
            hb_font_funcs_t *ffuncs,
            hb_font_get_font_v_extents_func_t func,
            void *user_data, hb_destroy_func_t destroy)
        hb_font_funcs_set_font_v_extents_func;

    /**
    * hb_font_funcs_set_nominal_glyph_func:
    * @ffuncs: A font-function structure
    * @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
    * @user_data: Data to pass to @func
    * @destroy: (nullable): The function to call when @user_data is not needed anymore
    *
    * Sets the implementation function for #hb_font_get_nominal_glyph_func_t.
    *
    * Since: 1.2.3
    **/
    void
    function (
            hb_font_funcs_t *ffuncs,
            hb_font_get_nominal_glyph_func_t func,
            void *user_data, hb_destroy_func_t destroy)
        hb_font_funcs_set_nominal_glyph_func;

    /**
    * hb_font_funcs_set_nominal_glyphs_func:
    * @ffuncs: A font-function structure
    * @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
    * @user_data: Data to pass to @func
    * @destroy: (nullable): The function to call when @user_data is not needed anymore
    *
    * Sets the implementation function for #hb_font_get_nominal_glyphs_func_t.
    *
    * Since: 2.0.0
    **/
    void
    function (
            hb_font_funcs_t *ffuncs,
            hb_font_get_nominal_glyphs_func_t func,
            void *user_data, hb_destroy_func_t destroy)
        hb_font_funcs_set_nominal_glyphs_func;

    /**
    * hb_font_funcs_set_variation_glyph_func:
    * @ffuncs: A font-function structure
    * @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
    * @user_data: Data to pass to @func
    * @destroy: (nullable): The function to call when @user_data is not needed anymore
    *
    * Sets the implementation function for #hb_font_get_variation_glyph_func_t.
    *
    * Since: 1.2.3
    **/
    void
    function (
            hb_font_funcs_t *ffuncs,
            hb_font_get_variation_glyph_func_t func,
            void *user_data, hb_destroy_func_t destroy)
        hb_font_funcs_set_variation_glyph_func;

    /**
    * hb_font_funcs_set_glyph_h_advance_func:
    * @ffuncs: A font-function structure
    * @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
    * @user_data: Data to pass to @func
    * @destroy: (nullable): The function to call when @user_data is not needed anymore
    *
    * Sets the implementation function for #hb_font_get_glyph_h_advance_func_t.
    *
    * Since: 0.9.2
    **/
    void
    function (
            hb_font_funcs_t *ffuncs,
            hb_font_get_glyph_h_advance_func_t func,
            void *user_data, hb_destroy_func_t destroy)
        hb_font_funcs_set_glyph_h_advance_func;

    /**
    * hb_font_funcs_set_glyph_v_advance_func:
    * @ffuncs: A font-function structure
    * @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
    * @user_data: Data to pass to @func
    * @destroy: (nullable): The function to call when @user_data is not needed anymore
    *
    * Sets the implementation function for #hb_font_get_glyph_v_advance_func_t.
    *
    * Since: 0.9.2
    **/
    void
    function (
            hb_font_funcs_t *ffuncs,
            hb_font_get_glyph_v_advance_func_t func,
            void *user_data, hb_destroy_func_t destroy)
        hb_font_funcs_set_glyph_v_advance_func;

    /**
    * hb_font_funcs_set_glyph_h_advances_func:
    * @ffuncs: A font-function structure
    * @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
    * @user_data: Data to pass to @func
    * @destroy: (nullable): The function to call when @user_data is not needed anymore
    *
    * Sets the implementation function for #hb_font_get_glyph_h_advances_func_t.
    *
    * Since: 1.8.6
    **/
    void
    function (
            hb_font_funcs_t *ffuncs,
            hb_font_get_glyph_h_advances_func_t func,
            void *user_data, hb_destroy_func_t destroy)
        hb_font_funcs_set_glyph_h_advances_func;

    /**
    * hb_font_funcs_set_glyph_v_advances_func:
    * @ffuncs: A font-function structure
    * @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
    * @user_data: Data to pass to @func
    * @destroy: (nullable): The function to call when @user_data is not needed anymore
    *
    * Sets the implementation function for #hb_font_get_glyph_v_advances_func_t.
    *
    * Since: 1.8.6
    **/
    void
    function (
            hb_font_funcs_t *ffuncs,
            hb_font_get_glyph_v_advances_func_t func,
            void *user_data, hb_destroy_func_t destroy)
        hb_font_funcs_set_glyph_v_advances_func;

    /**
    * hb_font_funcs_set_glyph_h_origin_func:
    * @ffuncs: A font-function structure
    * @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
    * @user_data: Data to pass to @func
    * @destroy: (nullable): The function to call when @user_data is not needed anymore
    *
    * Sets the implementation function for #hb_font_get_glyph_h_origin_func_t.
    *
    * Since: 0.9.2
    **/
    void
    function (
            hb_font_funcs_t *ffuncs,
            hb_font_get_glyph_h_origin_func_t func,
            void *user_data, hb_destroy_func_t destroy)
        hb_font_funcs_set_glyph_h_origin_func;

    /**
    * hb_font_funcs_set_glyph_v_origin_func:
    * @ffuncs: A font-function structure
    * @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
    * @user_data: Data to pass to @func
    * @destroy: (nullable): The function to call when @user_data is not needed anymore
    *
    * Sets the implementation function for #hb_font_get_glyph_v_origin_func_t.
    *
    * Since: 0.9.2
    **/
    void
    function (
            hb_font_funcs_t *ffuncs,
            hb_font_get_glyph_v_origin_func_t func,
            void *user_data, hb_destroy_func_t destroy)
        hb_font_funcs_set_glyph_v_origin_func;

    /**
    * hb_font_funcs_set_glyph_h_kerning_func:
    * @ffuncs: A font-function structure
    * @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
    * @user_data: Data to pass to @func
    * @destroy: (nullable): The function to call when @user_data is not needed anymore
    *
    * Sets the implementation function for #hb_font_get_glyph_h_kerning_func_t.
    *
    * Since: 0.9.2
    **/
    void
    function (
            hb_font_funcs_t *ffuncs,
            hb_font_get_glyph_h_kerning_func_t func,
            void *user_data, hb_destroy_func_t destroy)
        hb_font_funcs_set_glyph_h_kerning_func;

    /**
    * hb_font_funcs_set_glyph_extents_func:
    * @ffuncs: A font-function structure
    * @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
    * @user_data: Data to pass to @func
    * @destroy: (nullable): The function to call when @user_data is not needed anymore
    *
    * Sets the implementation function for #hb_font_get_glyph_extents_func_t.
    *
    * Since: 0.9.2
    **/
    void
    function (
            hb_font_funcs_t *ffuncs,
            hb_font_get_glyph_extents_func_t func,
            void *user_data, hb_destroy_func_t destroy)
        hb_font_funcs_set_glyph_extents_func;

    /**
    * hb_font_funcs_set_glyph_contour_point_func:
    * @ffuncs: A font-function structure
    * @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
    * @user_data: Data to pass to @func
    * @destroy: (nullable): The function to call when @user_data is not needed anymore
    *
    * Sets the implementation function for #hb_font_get_glyph_contour_point_func_t.
    *
    * Since: 0.9.2
    **/
    void
    function (
            hb_font_funcs_t *ffuncs,
            hb_font_get_glyph_contour_point_func_t func,
            void *user_data, hb_destroy_func_t destroy)
        hb_font_funcs_set_glyph_contour_point_func;

    /**
    * hb_font_funcs_set_glyph_name_func:
    * @ffuncs: A font-function structure
    * @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
    * @user_data: Data to pass to @func
    * @destroy: (nullable): The function to call when @user_data is not needed anymore
    *
    * Sets the implementation function for #hb_font_get_glyph_name_func_t.
    *
    * Since: 0.9.2
    **/
    void
    function (
            hb_font_funcs_t *ffuncs,
            hb_font_get_glyph_name_func_t func,
            void *user_data, hb_destroy_func_t destroy)
        hb_font_funcs_set_glyph_name_func;

    /**
    * hb_font_funcs_set_glyph_from_name_func:
    * @ffuncs: A font-function structure
    * @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
    * @user_data: Data to pass to @func
    * @destroy: (nullable): The function to call when @user_data is not needed anymore
    *
    * Sets the implementation function for #hb_font_get_glyph_from_name_func_t.
    *
    * Since: 0.9.2
    **/
    void
    function (
            hb_font_funcs_t *ffuncs,
            hb_font_get_glyph_from_name_func_t func,
            void *user_data, hb_destroy_func_t destroy)
        hb_font_funcs_set_glyph_from_name_func;

    /**
    * hb_font_funcs_set_draw_glyph_func:
    * @ffuncs: A font-function structure
    * @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
    * @user_data: Data to pass to @func
    * @destroy: (nullable): The function to call when @user_data is not needed anymore
    *
    * Sets the implementation function for #hb_font_draw_glyph_func_t.
    *
    * Since: 7.0.0
    **/
    void
    function (
            hb_font_funcs_t *ffuncs,
            hb_font_draw_glyph_func_t func,
            void *user_data, hb_destroy_func_t destroy)
        hb_font_funcs_set_draw_glyph_func;

    /**
    * hb_font_funcs_set_paint_glyph_func:
    * @ffuncs: A font-function structure
    * @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
    * @user_data: Data to pass to @func
    * @destroy: (nullable): The function to call when @user_data is no longer needed
    *
    * Sets the implementation function for #hb_font_paint_glyph_func_t.
    *
    * Since: 7.0.0
    */
    void
    function (
            hb_font_funcs_t *ffuncs,
            hb_font_paint_glyph_func_t func,
            void *user_data, hb_destroy_func_t destroy)
        hb_font_funcs_set_paint_glyph_func;

    /* func dispatch */

    hb_bool_t
    function (
            hb_font_t *font,
            hb_font_extents_t *extents)
        hb_font_get_h_extents;
    hb_bool_t
    function (
            hb_font_t *font,
            hb_font_extents_t *extents)
        hb_font_get_v_extents;

    hb_bool_t
    function (
            hb_font_t *font,
            hb_codepoint_t unicode,
            hb_codepoint_t *glyph)
        hb_font_get_nominal_glyph;
    hb_bool_t
    function (
            hb_font_t *font,
            hb_codepoint_t unicode, hb_codepoint_t variation_selector,
            hb_codepoint_t *glyph)
        hb_font_get_variation_glyph;

    uint
    function (
            hb_font_t *font,
            uint count,
            const hb_codepoint_t *first_unicode,
            uint unicode_stride,
            hb_codepoint_t *first_glyph,
            uint glyph_stride)
        hb_font_get_nominal_glyphs;

    hb_position_t
    function (
            hb_font_t *font,
            hb_codepoint_t glyph)
        hb_font_get_glyph_h_advance;
    hb_position_t
    function (
            hb_font_t *font,
            hb_codepoint_t glyph)
        hb_font_get_glyph_v_advance;

//FIXME: unsigned?
    void
    function (
            hb_font_t* font,
            uint count,
            const hb_codepoint_t *first_glyph,
            uint glyph_stride,
            hb_position_t *first_advance,
            uint advance_stride)
        hb_font_get_glyph_h_advances;
//FIXME: unsigned?
    void
    function (
            hb_font_t* font,
            uint count,
            const hb_codepoint_t *first_glyph,
            uint glyph_stride,
            hb_position_t *first_advance,
            uint advance_stride)
        hb_font_get_glyph_v_advances;

    hb_bool_t
    function (
            hb_font_t *font,
            hb_codepoint_t glyph,
            hb_position_t *x, hb_position_t *y)
        hb_font_get_glyph_h_origin;
    hb_bool_t
    function (
            hb_font_t *font,
            hb_codepoint_t glyph,
            hb_position_t *x, hb_position_t *y)
        hb_font_get_glyph_v_origin;

    hb_position_t
    function (
            hb_font_t *font,
            hb_codepoint_t left_glyph, hb_codepoint_t right_glyph)
        hb_font_get_glyph_h_kerning;

    hb_bool_t
    function (
            hb_font_t *font,
            hb_codepoint_t glyph,
            hb_glyph_extents_t *extents)
        hb_font_get_glyph_extents;

    hb_bool_t
    function (
            hb_font_t *font,
            hb_codepoint_t glyph, uint point_index,
            hb_position_t *x, hb_position_t *y)
        hb_font_get_glyph_contour_point;

    hb_bool_t
    function (
            hb_font_t *font,
            hb_codepoint_t glyph,
            char *name, uint size)
        hb_font_get_glyph_name;
    
    hb_bool_t
    function (
            hb_font_t *font,
            const char *name, int len, /* -1 means nul-terminated */
            hb_codepoint_t *glyph)
        hb_font_get_glyph_from_name;

    void
    function (
            hb_font_t *font,
            hb_codepoint_t glyph,
            hb_draw_funcs_t *dfuncs, void *draw_data)
        hb_font_draw_glyph;

    void
    function (
            hb_font_t *font,
            hb_codepoint_t glyph,
            hb_paint_funcs_t *pfuncs, void *paint_data,
            uint palette_index,
            hb_color_t foreground)
        hb_font_paint_glyph;

    /* high-level funcs, with fallback */

    /* Calls either hb_font_get_nominal_glyph() if variation_selector is 0,
    * otherwise calls hb_font_get_variation_glyph(). */
    hb_bool_t
    function (
            hb_font_t *font,
            hb_codepoint_t unicode, hb_codepoint_t variation_selector,
            hb_codepoint_t *glyph)
        hb_font_get_glyph;

    void
    function (
            hb_font_t *font,
            hb_direction_t direction,
            hb_font_extents_t *extents)
        hb_font_get_extents_for_direction;
    void
    function (
            hb_font_t *font,
            hb_codepoint_t glyph,
            hb_direction_t direction,
            hb_position_t *x, hb_position_t *y)
        hb_font_get_glyph_advance_for_direction;
    void
//FIXME: unsigned?
    function (
            hb_font_t* font,
            hb_direction_t direction,
            uint count,
            const hb_codepoint_t *first_glyph,
            uint glyph_stride,
            hb_position_t *first_advance,
            uint advance_stride)
        hb_font_get_glyph_advances_for_direction;
    void
    function (
            hb_font_t *font,
            hb_codepoint_t glyph,
            hb_direction_t direction,
            hb_position_t *x, hb_position_t *y)
        hb_font_get_glyph_origin_for_direction;
    void
    function (
            hb_font_t *font,
            hb_codepoint_t glyph,
            hb_direction_t direction,
            hb_position_t *x, hb_position_t *y)
        hb_font_add_glyph_origin_for_direction;
    void
    function (
            hb_font_t *font,
            hb_codepoint_t glyph,
            hb_direction_t direction,
            hb_position_t *x, hb_position_t *y)
        hb_font_subtract_glyph_origin_for_direction;

    void
    function (
            hb_font_t *font,
            hb_codepoint_t first_glyph, hb_codepoint_t second_glyph,
            hb_direction_t direction,
            hb_position_t *x, hb_position_t *y)
        hb_font_get_glyph_kerning_for_direction;

    hb_bool_t
    function (
            hb_font_t *font,
            hb_codepoint_t glyph,
            hb_direction_t direction,
            hb_glyph_extents_t *extents)
        hb_font_get_glyph_extents_for_origin;

    hb_bool_t
    function (
            hb_font_t *font,
            hb_codepoint_t glyph, uint point_index,
            hb_direction_t direction,
            hb_position_t *x, hb_position_t *y)
        hb_font_get_glyph_contour_point_for_origin;

    /* Generates gidDDD if glyph has no name. */
    void
    function (
            hb_font_t *font,
            hb_codepoint_t glyph,
            char *s, uint size)
        hb_font_glyph_to_string;
    /* Parses gidDDD and uniUUUU strings automatically. */
    hb_bool_t
    function (
            hb_font_t *font,
            const char *s, int len, /* -1 means nul-terminated */
            hb_codepoint_t *glyph)
        hb_font_glyph_from_string;


    /*
    * hb_font_t
    */

    /* Fonts are very light-weight objects */

    hb_font_t *
    function (hb_face_t *face)
        hb_font_create;

    hb_font_t *
    function (hb_font_t *parent)
        hb_font_create_sub_font;

    hb_font_t *
    function ()
        hb_font_get_empty;

    hb_font_t *
    function (hb_font_t *font)
        hb_font_reference;

    void
    function (hb_font_t *font)
        hb_font_destroy;

    hb_bool_t
    function (
            hb_font_t          *font,
            hb_user_data_key_t *key,
            void *              data,
            hb_destroy_func_t   destroy,
            hb_bool_t           replace)
        hb_font_set_user_data;


    void *
    function (
            const hb_font_t    *font,
            hb_user_data_key_t *key)
        hb_font_get_user_data;

    void
    function (hb_font_t *font)
        hb_font_make_immutable;

    hb_bool_t
    function (hb_font_t *font)
        hb_font_is_immutable;

    uint
    function (hb_font_t *font)
        hb_font_get_serial;

    void
    function (hb_font_t *font)
        hb_font_changed;

    void
    function (
            hb_font_t *font,
            hb_font_t *parent)
        hb_font_set_parent;

    hb_font_t *
    function (hb_font_t *font)
        hb_font_get_parent;

    void
    function (
            hb_font_t *font,
            hb_face_t *face)
        hb_font_set_face;

    hb_face_t *
    function (hb_font_t *font)
        hb_font_get_face;


    void
    function (
            hb_font_t         *font,
            hb_font_funcs_t   *klass,
            void              *font_data,
            hb_destroy_func_t  destroy)
        hb_font_set_funcs;

    /* Be *very* careful with this function! */
    void
    function (
            hb_font_t         *font,
            void              *font_data,
            hb_destroy_func_t  destroy)
        hb_font_set_funcs_data;


    void
    function (
            hb_font_t *font,
            int x_scale,
            int y_scale)
        hb_font_set_scale;

    void
    function (
            hb_font_t *font,
            int *x_scale,
            int *y_scale)
        hb_font_get_scale;

    /*
    * A zero value means "no hinting in that direction"
    */
    void
    function (
            hb_font_t *font,
            uint x_ppem,
            uint y_ppem)
        hb_font_set_ppem;

    void
    function (
            hb_font_t *font,
            uint *x_ppem,
            uint *y_ppem)
        hb_font_get_ppem;

    /*
    * Point size per EM.  Used for optical-sizing in CoreText.
    * A value of zero means "not set".
    */
    void
    function (hb_font_t *font, float ptem)
        hb_font_set_ptem;

    float
    function (hb_font_t *font)
        hb_font_get_ptem;

    void
    function (hb_font_t *font,
                    float x_embolden, float y_embolden,
                    hb_bool_t in_place)
        hb_font_set_synthetic_bold;

    void
    function (hb_font_t *font,
                    float *x_embolden, float *y_embolden,
                    hb_bool_t *in_place)
        hb_font_get_synthetic_bold;

    void
    function (hb_font_t *font, float slant)
        hb_font_set_synthetic_slant;

    float
    function (hb_font_t *font)
        hb_font_get_synthetic_slant;

    void
    function (
            hb_font_t *font,
            const hb_variation_t *variations,
            uint variations_length)
        hb_font_set_variations;

    void
    function (
            hb_font_t *font,
            hb_tag_t tag,
            float    value)
        hb_font_set_variation;

    void
    function (
            hb_font_t *font,
            const float *coords,
            uint coords_length)
        hb_font_set_var_coords_design;

    //FIXME: const float *
    float *
    function (
            hb_font_t *font,
            uint *length)
        hb_font_get_var_coords_design;

    void
    function (
            hb_font_t *font,
            const int *coords, /* 2.14 normalized */
            uint coords_length)
        hb_font_set_var_coords_normalized;

    //FIXME: const int *
    int *
    function (
            hb_font_t *font,
            uint *length)
        hb_font_get_var_coords_normalized;

    void
    function (
            hb_font_t *font,
            uint instance_index)
        hb_font_set_var_named_instance;

    uint
    function (hb_font_t *font)
        hb_font_get_var_named_instance;
}
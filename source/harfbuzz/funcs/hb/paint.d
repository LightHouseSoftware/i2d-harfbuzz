/*
 * Adapted from hb-paint.h by Grillo del Mal
 *
 * Copyright © 2022 Matthias Clasen
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
 */

module harfbuzz.funcs.hb.paint;
import harfbuzz.types.hb.paint;

import harfbuzz.types.hb.common;
import harfbuzz.types.hb.blob;

nothrow @nogc:
extern (C):

__gshared {
    hb_paint_funcs_t *
    function ()
        hb_paint_funcs_create;

    hb_paint_funcs_t *
    function ()
        hb_paint_funcs_get_empty;

    hb_paint_funcs_t *
    function (hb_paint_funcs_t *funcs)
        hb_paint_funcs_reference;

    void
    function (hb_paint_funcs_t *funcs)
        hb_paint_funcs_destroy;

    hb_bool_t
    function (
            hb_paint_funcs_t *funcs,
            hb_user_data_key_t *key,
            void *              data,
            hb_destroy_func_t   destroy,
            hb_bool_t           replace)
        hb_paint_funcs_set_user_data;


    void *
    function (
            const hb_paint_funcs_t *funcs,
            hb_user_data_key_t       *key)
        hb_paint_funcs_get_user_data;

    void
    function (hb_paint_funcs_t *funcs)
        hb_paint_funcs_make_immutable;

    hb_bool_t
    function (hb_paint_funcs_t *funcs)
        hb_paint_funcs_is_immutable;

    uint
    function (
            hb_color_line_t *color_line,
            uint start,
            uint *count,
            hb_color_stop_t *color_stops)
        hb_color_line_get_color_stops;

    hb_paint_extend_t
    function (hb_color_line_t *color_line)
        hb_color_line_get_extend;

    void
    function (
            hb_paint_funcs_t               *funcs,
            hb_paint_push_transform_func_t  func,
            void                           *user_data,
            hb_destroy_func_t               destroy)
        hb_paint_funcs_set_push_transform_func;

    /**
    * hb_paint_funcs_set_pop_transform_func:
    * @funcs: A paint functions struct
    * @func: (closure user_data) (destroy destroy) (scope notified): The pop-transform callback
    * @user_data: Data to pass to @func
    * @destroy: (nullable): Function to call when @user_data is no longer needed
    *
    * Sets the pop-transform callback on the paint functions struct.
    *
    * Since: 7.0.0
    */
    void
    function (
            hb_paint_funcs_t              *funcs,
            hb_paint_pop_transform_func_t  func,
            void                          *user_data,
            hb_destroy_func_t              destroy)
        hb_paint_funcs_set_pop_transform_func;

    /**
    * hb_paint_funcs_set_color_glyph_func:
    * @funcs: A paint functions struct
    * @func: (closure user_data) (destroy destroy) (scope notified): The color-glyph callback
    * @user_data: Data to pass to @func
    * @destroy: (nullable): Function to call when @user_data is no longer needed
    *
    * Sets the color-glyph callback on the paint functions struct.
    *
    * Since: 8.2.0
    */
    void
    function (
            hb_paint_funcs_t                *funcs,
            hb_paint_color_glyph_func_t     func,
            void                            *user_data,
            hb_destroy_func_t                destroy)
        hb_paint_funcs_set_color_glyph_func;

    /**
    * hb_paint_funcs_set_push_clip_glyph_func:
    * @funcs: A paint functions struct
    * @func: (closure user_data) (destroy destroy) (scope notified): The push-clip-glyph callback
    * @user_data: Data to pass to @func
    * @destroy: (nullable): Function to call when @user_data is no longer needed
    *
    * Sets the push-clip-glyph callback on the paint functions struct.
    *
    * Since: 7.0.0
    */
    void
    function (
            hb_paint_funcs_t                *funcs,
            hb_paint_push_clip_glyph_func_t  func,
            void                            *user_data,
            hb_destroy_func_t                destroy)
        hb_paint_funcs_set_push_clip_glyph_func;

    /**
    * hb_paint_funcs_set_push_clip_rectangle_func:
    * @funcs: A paint functions struct
    * @func: (closure user_data) (destroy destroy) (scope notified): The push-clip-rectangle callback
    * @user_data: Data to pass to @func
    * @destroy: (nullable): Function to call when @user_data is no longer needed
    *
    * Sets the push-clip-rect callback on the paint functions struct.
    *
    * Since: 7.0.0
    */
    void
    function (
            hb_paint_funcs_t                    *funcs,
            hb_paint_push_clip_rectangle_func_t  func,
            void                                *user_data,
            hb_destroy_func_t                    destroy)
        hb_paint_funcs_set_push_clip_rectangle_func;

    /**
    * hb_paint_funcs_set_pop_clip_func:
    * @funcs: A paint functions struct
    * @func: (closure user_data) (destroy destroy) (scope notified): The pop-clip callback
    * @user_data: Data to pass to @func
    * @destroy: (nullable): Function to call when @user_data is no longer needed
    *
    * Sets the pop-clip callback on the paint functions struct.
    *
    * Since: 7.0.0
    */
    void
    function (
            hb_paint_funcs_t         *funcs,
            hb_paint_pop_clip_func_t  func,
            void                     *user_data,
            hb_destroy_func_t         destroy)
        hb_paint_funcs_set_pop_clip_func;

    /**
    * hb_paint_funcs_set_color_func:
    * @funcs: A paint functions struct
    * @func: (closure user_data) (destroy destroy) (scope notified): The paint-color callback
    * @user_data: Data to pass to @func
    * @destroy: (nullable): Function to call when @user_data is no longer needed
    *
    * Sets the paint-color callback on the paint functions struct.
    *
    * Since: 7.0.0
    */
    void
    function (
            hb_paint_funcs_t      *funcs,
            hb_paint_color_func_t  func,
            void                  *user_data,
            hb_destroy_func_t      destroy)
        hb_paint_funcs_set_color_func;

    /**
    * hb_paint_funcs_set_image_func:
    * @funcs: A paint functions struct
    * @func: (closure user_data) (destroy destroy) (scope notified): The paint-image callback
    * @user_data: Data to pass to @func
    * @destroy: (nullable): Function to call when @user_data is no longer needed
    *
    * Sets the paint-image callback on the paint functions struct.
    *
    * Since: 7.0.0
    */
    void
    function (
            hb_paint_funcs_t      *funcs,
            hb_paint_image_func_t  func,
            void                  *user_data,
            hb_destroy_func_t      destroy)
        hb_paint_funcs_set_image_func;

    /**
    * hb_paint_funcs_set_linear_gradient_func:
    * @funcs: A paint functions struct
    * @func: (closure user_data) (destroy destroy) (scope notified): The linear-gradient callback
    * @user_data: Data to pass to @func
    * @destroy: (nullable): Function to call when @user_data is no longer needed
    *
    * Sets the linear-gradient callback on the paint functions struct.
    *
    * Since: 7.0.0
    */
    void
    function (
            hb_paint_funcs_t                *funcs,
            hb_paint_linear_gradient_func_t  func,
            void                            *user_data,
            hb_destroy_func_t                destroy)
        hb_paint_funcs_set_linear_gradient_func;

    /**
    * hb_paint_funcs_set_radial_gradient_func:
    * @funcs: A paint functions struct
    * @func: (closure user_data) (destroy destroy) (scope notified): The radial-gradient callback
    * @user_data: Data to pass to @func
    * @destroy: (nullable): Function to call when @user_data is no longer needed
    *
    * Sets the radial-gradient callback on the paint functions struct.
    *
    * Since: 7.0.0
    */
    void
    function (
            hb_paint_funcs_t                *funcs,
            hb_paint_radial_gradient_func_t  func,
            void                            *user_data,
            hb_destroy_func_t                destroy)
        hb_paint_funcs_set_radial_gradient_func;

    /**
    * hb_paint_funcs_set_sweep_gradient_func:
    * @funcs: A paint functions struct
    * @func: (closure user_data) (destroy destroy) (scope notified): The sweep-gradient callback
    * @user_data: Data to pass to @func
    * @destroy: (nullable): Function to call when @user_data is no longer needed
    *
    * Sets the sweep-gradient callback on the paint functions struct.
    *
    * Since: 7.0.0
    */
    void
    function (
            hb_paint_funcs_t               *funcs,
            hb_paint_sweep_gradient_func_t  func,
            void                           *user_data,
            hb_destroy_func_t               destroy)
        hb_paint_funcs_set_sweep_gradient_func;

    /**
    * hb_paint_funcs_set_push_group_func:
    * @funcs: A paint functions struct
    * @func: (closure user_data) (destroy destroy) (scope notified): The push-group callback
    * @user_data: Data to pass to @func
    * @destroy: (nullable): Function to call when @user_data is no longer needed
    *
    * Sets the push-group callback on the paint functions struct.
    *
    * Since: 7.0.0
    */
    void
    function (
            hb_paint_funcs_t           *funcs,
            hb_paint_push_group_func_t  func,
            void                       *user_data,
            hb_destroy_func_t           destroy)
        hb_paint_funcs_set_push_group_func;

    /**
    * hb_paint_funcs_set_pop_group_func:
    * @funcs: A paint functions struct
    * @func: (closure user_data) (destroy destroy) (scope notified): The pop-group callback
    * @user_data: Data to pass to @func
    * @destroy: (nullable): Function to call when @user_data is no longer needed
    *
    * Sets the pop-group callback on the paint functions struct.
    *
    * Since: 7.0.0
    */
    void
    function (
            hb_paint_funcs_t          *funcs,
            hb_paint_pop_group_func_t  func,
            void                       *user_data,
            hb_destroy_func_t           destroy)
        hb_paint_funcs_set_pop_group_func;

    /**
    * hb_paint_funcs_set_custom_palette_color_func:
    * @funcs: A paint functions struct
    * @func: (closure user_data) (destroy destroy) (scope notified): The custom-palette-color callback
    * @user_data: Data to pass to @func
    * @destroy: (nullable): Function to call when @user_data is no longer needed
    *
    * Sets the custom-palette-color callback on the paint functions struct.
    *
    * Since: 7.0.0
    */
    void
    function (
            hb_paint_funcs_t                     *funcs,
            hb_paint_custom_palette_color_func_t  func,
            void                                 *user_data,
            hb_destroy_func_t                     destroy)
        hb_paint_funcs_set_custom_palette_color_func;
    /*
    * Manual API
    */

    void
    function (
            hb_paint_funcs_t *funcs, void *paint_data,
            float xx, float yx,
            float xy, float yy,
            float dx, float dy)
        hb_paint_push_transform;

    void
    function (hb_paint_funcs_t *funcs, void *paint_data)
        hb_paint_pop_transform;

    hb_bool_t
    function (
            hb_paint_funcs_t *funcs, void *paint_data,
            hb_codepoint_t glyph,
            hb_font_t *font)
        hb_paint_color_glyph;

    void
    function (
            hb_paint_funcs_t *funcs, void *paint_data,
            hb_codepoint_t glyph,
            hb_font_t *font)
        hb_paint_push_clip_glyph;

    void
    function (
            hb_paint_funcs_t *funcs, void *paint_data,
            float xmin, float ymin,
            float xmax, float ymax)
        hb_paint_push_clip_rectangle;

    void
    function (hb_paint_funcs_t *funcs, void *paint_data)
        hb_paint_pop_clip;

    void
    function (
            hb_paint_funcs_t *funcs, void *paint_data,
            hb_bool_t is_foreground,
            hb_color_t color)
        hb_paint_color;

    void
    function (
            hb_paint_funcs_t *funcs, void *paint_data,
            hb_blob_t *image,
            uint width,
            uint height,
            hb_tag_t format,
            float slant,
            hb_glyph_extents_t *extents)
        hb_paint_image;

    void
    function (
            hb_paint_funcs_t *funcs, void *paint_data,
            hb_color_line_t *color_line,
            float x0, float y0,
            float x1, float y1,
            float x2, float y2)
        hb_paint_linear_gradient;

    void
    function (
            hb_paint_funcs_t *funcs, void *paint_data,
            hb_color_line_t *color_line,
            float x0, float y0,
            float r0,
            float x1, float y1,
            float r1)
        hb_paint_radial_gradient;

    void
    function (
            hb_paint_funcs_t *funcs, void *paint_data,
            hb_color_line_t *color_line,
            float x0, float y0,
            float start_angle, float end_angle)
        hb_paint_sweep_gradient;

    void
    function (hb_paint_funcs_t *funcs, void *paint_data)
        hb_paint_push_group;

    void
    function (
            hb_paint_funcs_t *funcs, void *paint_data,
            hb_paint_composite_mode_t mode)
        hb_paint_pop_group;

    hb_bool_t
    function (
            hb_paint_funcs_t *funcs, void *paint_data,
            uint color_index,
            hb_color_t *color)
        hb_paint_custom_palette_color;
}

/*
 * Adapted from hb-draw.h by Grillo del Mal
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
 
module harfbuzz.funcs.hb.draw;
import harfbuzz.types.hb.draw;

import harfbuzz.types.hb.common;

nothrow @nogc:
extern (C):

__gshared {
    /**
    * hb_draw_funcs_set_move_to_func:
    * @dfuncs: draw functions object
    * @func: (closure user_data) (destroy destroy) (scope notified): move-to callback
    * @user_data: Data to pass to @func
    * @destroy: (nullable): The function to call when @user_data is not needed anymore
    *
    * Sets move-to callback to the draw functions object.
    *
    * Since: 4.0.0
    **/
    void
    function (
            hb_draw_funcs_t        *dfuncs,
            hb_draw_move_to_func_t  func,
            void *user_data, hb_destroy_func_t destroy)
        hb_draw_funcs_set_move_to_func;

    /**
    * hb_draw_funcs_set_line_to_func:
    * @dfuncs: draw functions object
    * @func: (closure user_data) (destroy destroy) (scope notified): line-to callback
    * @user_data: Data to pass to @func
    * @destroy: (nullable): The function to call when @user_data is not needed anymore
    *
    * Sets line-to callback to the draw functions object.
    *
    * Since: 4.0.0
    **/
    void
    function (
            hb_draw_funcs_t        *dfuncs,
            hb_draw_line_to_func_t  func,
            void *user_data, hb_destroy_func_t destroy)
        hb_draw_funcs_set_line_to_func;

    /**
    * hb_draw_funcs_set_quadratic_to_func:
    * @dfuncs: draw functions object
    * @func: (closure user_data) (destroy destroy) (scope notified): quadratic-to callback
    * @user_data: Data to pass to @func
    * @destroy: (nullable): The function to call when @user_data is not needed anymore
    *
    * Sets quadratic-to callback to the draw functions object.
    *
    * Since: 4.0.0
    **/
    void
    function (
            hb_draw_funcs_t             *dfuncs,
            hb_draw_quadratic_to_func_t  func,
            void *user_data, hb_destroy_func_t destroy)
        hb_draw_funcs_set_quadratic_to_func;

    /**
    * hb_draw_funcs_set_cubic_to_func:
    * @dfuncs: draw functions
    * @func: (closure user_data) (destroy destroy) (scope notified): cubic-to callback
    * @user_data: Data to pass to @func
    * @destroy: (nullable): The function to call when @user_data is not needed anymore
    *
    * Sets cubic-to callback to the draw functions object.
    *
    * Since: 4.0.0
    **/
    void
    function (
            hb_draw_funcs_t         *dfuncs,
            hb_draw_cubic_to_func_t  func,
            void *user_data, hb_destroy_func_t destroy)
        hb_draw_funcs_set_cubic_to_func;

    /**
    * hb_draw_funcs_set_close_path_func:
    * @dfuncs: draw functions object
    * @func: (closure user_data) (destroy destroy) (scope notified): close-path callback
    * @user_data: Data to pass to @func
    * @destroy: (nullable): The function to call when @user_data is not needed anymore
    *
    * Sets close-path callback to the draw functions object.
    *
    * Since: 4.0.0
    **/
    void
    function (
            hb_draw_funcs_t           *dfuncs,
            hb_draw_close_path_func_t  func,
            void *user_data, hb_destroy_func_t destroy)
        hb_draw_funcs_set_close_path_func;


    hb_draw_funcs_t *
    function ()
        hb_draw_funcs_create;

    hb_draw_funcs_t *
    function ()
        hb_draw_funcs_get_empty;

    hb_draw_funcs_t *
    function (hb_draw_funcs_t *dfuncs)
        hb_draw_funcs_reference;

    void
    function (hb_draw_funcs_t *dfuncs)
        hb_draw_funcs_destroy;

    hb_bool_t
    function (
            hb_draw_funcs_t *dfuncs,
            hb_user_data_key_t *key,
            void *              data,
            hb_destroy_func_t   destroy,
            hb_bool_t           replace)
        hb_draw_funcs_set_user_data;


    void *
    function (
            const hb_draw_funcs_t *dfuncs,
            hb_user_data_key_t       *key)
        hb_draw_funcs_get_user_data;

    void
    function (hb_draw_funcs_t *dfuncs)
        hb_draw_funcs_make_immutable;

    hb_bool_t
    function (hb_draw_funcs_t *dfuncs)
        hb_draw_funcs_is_immutable;


    void
    function (
            hb_draw_funcs_t *dfuncs, void *draw_data,
            hb_draw_state_t *st,
            float to_x, float to_y)
        hb_draw_move_to;

    void
    function (
            hb_draw_funcs_t *dfuncs, void *draw_data,
            hb_draw_state_t *st,
            float to_x, float to_y)
        hb_draw_line_to;

    void
    function (
            hb_draw_funcs_t *dfuncs, void *draw_data,
            hb_draw_state_t *st,
            float control_x, float control_y,
            float to_x, float to_y)
        hb_draw_quadratic_to;

    void
    function (
            hb_draw_funcs_t *dfuncs, void *draw_data,
            hb_draw_state_t *st,
            float control1_x, float control1_y,
            float control2_x, float control2_y,
            float to_x, float to_y)
        hb_draw_cubic_to;

    void
    function (
            hb_draw_funcs_t *dfuncs, void *draw_data,
            hb_draw_state_t *st)
        hb_draw_close_path;
}

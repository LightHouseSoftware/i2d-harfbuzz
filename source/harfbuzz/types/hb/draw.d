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
 
 module harfbuzz.types.hb.draw;

import harfbuzz.types.hb.common;

nothrow @nogc:
extern (C):

/**
 * hb_draw_state_t
 * @path_open: Whether there is an open path
 * @path_start_x: X component of the start of current path
 * @path_start_y: Y component of the start of current path
 * @current_x: X component of current point
 * @current_y: Y component of current point
 *
 * Current drawing state.
 *
 * Since: 4.0.0
 **/
struct hb_draw_state_t {
  hb_bool_t path_open;

  float path_start_x;
  float path_start_y;

  float current_x;
  float current_y;

  /*< private >*/
  hb_var_num_t   reserved1;
  hb_var_num_t   reserved2;
  hb_var_num_t   reserved3;
  hb_var_num_t   reserved4;
  hb_var_num_t   reserved5;
  hb_var_num_t   reserved6;
  hb_var_num_t   reserved7;
}

/**
 * HB_DRAW_STATE_DEFAULT:
 *
 * The default #hb_draw_state_t at the start of glyph drawing.
 */
const hb_draw_state_t HB_DRAW_STATE_DEFAULT = {0, 0.0f, 0.0f, 0.0f, 0.0f, {0.}, {0.}, {0.}};


/**
 * hb_draw_funcs_t:
 *
 * Glyph draw callbacks.
 *
 * #hb_draw_move_to_func_t, #hb_draw_line_to_func_t and
 * #hb_draw_cubic_to_func_t calls are necessary to be defined but we translate
 * #hb_draw_quadratic_to_func_t calls to #hb_draw_cubic_to_func_t if the
 * callback isn't defined.
 *
 * Since: 4.0.0
 **/

struct hb_draw_funcs_t;


/**
 * hb_draw_move_to_func_t:
 * @dfuncs: draw functions object
 * @draw_data: The data accompanying the draw functions in hb_font_draw_glyph()
 * @st: current draw state
 * @to_x: X component of target point
 * @to_y: Y component of target point
 * @user_data: User data pointer passed to hb_draw_funcs_set_move_to_func()
 *
 * A virtual method for the #hb_draw_funcs_t to perform a "move-to" draw
 * operation.
 *
 * Since: 4.0.0
 *
 **/
alias hb_draw_move_to_func_t = 
    void 
    function (
            hb_draw_funcs_t *dfuncs, void *draw_data,
            hb_draw_state_t *st,
            float to_x, float to_y,
            void *user_data);

/**
 * hb_draw_line_to_func_t:
 * @dfuncs: draw functions object
 * @draw_data: The data accompanying the draw functions in hb_font_draw_glyph()
 * @st: current draw state
 * @to_x: X component of target point
 * @to_y: Y component of target point
 * @user_data: User data pointer passed to hb_draw_funcs_set_line_to_func()
 *
 * A virtual method for the #hb_draw_funcs_t to perform a "line-to" draw
 * operation.
 *
 * Since: 4.0.0
 *
 **/
alias hb_draw_line_to_func_t =
    void 
    function (
            hb_draw_funcs_t *dfuncs, void *draw_data,
            hb_draw_state_t *st,
            float to_x, float to_y,
            void *user_data);

/**
 * hb_draw_quadratic_to_func_t:
 * @dfuncs: draw functions object
 * @draw_data: The data accompanying the draw functions in hb_font_draw_glyph()
 * @st: current draw state
 * @control_x: X component of control point
 * @control_y: Y component of control point
 * @to_x: X component of target point
 * @to_y: Y component of target point
 * @user_data: User data pointer passed to hb_draw_funcs_set_quadratic_to_func()
 *
 * A virtual method for the #hb_draw_funcs_t to perform a "quadratic-to" draw
 * operation.
 *
 * Since: 4.0.0
 *
 **/
alias hb_draw_quadratic_to_func_t =
    void 
    function (
            hb_draw_funcs_t *dfuncs, void *draw_data,
            hb_draw_state_t *st,
            float control_x, float control_y,
            float to_x, float to_y,
            void *user_data);

/**
 * hb_draw_cubic_to_func_t:
 * @dfuncs: draw functions object
 * @draw_data: The data accompanying the draw functions in hb_font_draw_glyph()
 * @st: current draw state
 * @control1_x: X component of first control point
 * @control1_y: Y component of first control point
 * @control2_x: X component of second control point
 * @control2_y: Y component of second control point
 * @to_x: X component of target point
 * @to_y: Y component of target point
 * @user_data: User data pointer passed to hb_draw_funcs_set_cubic_to_func()
 *
 * A virtual method for the #hb_draw_funcs_t to perform a "cubic-to" draw
 * operation.
 *
 * Since: 4.0.0
 *
 **/
alias hb_draw_cubic_to_func_t =
    void
    function (
            hb_draw_funcs_t *dfuncs, void *draw_data,
            hb_draw_state_t *st,
            float control1_x, float control1_y,
            float control2_x, float control2_y,
            float to_x, float to_y,
            void *user_data);

/**
 * hb_draw_close_path_func_t:
 * @dfuncs: draw functions object
 * @draw_data: The data accompanying the draw functions in hb_font_draw_glyph()
 * @st: current draw state
 * @user_data: User data pointer passed to hb_draw_funcs_set_close_path_func()
 *
 * A virtual method for the #hb_draw_funcs_t to perform a "close-path" draw
 * operation.
 *
 * Since: 4.0.0
 *
 **/
alias hb_draw_close_path_func_t =
    void 
    function(
            hb_draw_funcs_t *dfuncs, void *draw_data,
            hb_draw_state_t *st,
            void *user_data);

/*
 * Adapted from hb-shape-plan.h by Grillo del Mal
 *
 * Copyright © 2012  Google, Inc.
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

module harfbuzz.funcs.hb.shape_plan;
import harfbuzz.types.hb.shape_plan;

import harfbuzz.types.hb.common;
//import harfbuzz.hb.font;
import harfbuzz.types.hb.face;
import harfbuzz.types.hb.buffer;

nothrow @nogc:
extern (C):

__gshared {

//FIXME: const char * const *shaper_list,
    hb_shape_plan_t *
    function (
            hb_face_t                     *face,
            const hb_segment_properties_t *props,
            const hb_feature_t            *user_features,
            uint                   num_user_features,
            const char * shaper_list)
        hb_shape_plan_create;

//FIXME: const char * const *shaper_list,
    hb_shape_plan_t *
    function (
            hb_face_t                     *face,
            const hb_segment_properties_t *props,
            const hb_feature_t            *user_features,
            uint                   num_user_features,
            const char * shaper_list)
        hb_shape_plan_create_cached;

//FIXME: const char * const *shaper_list,
    hb_shape_plan_t *
    function (
            hb_face_t                     *face,
            const hb_segment_properties_t *props,
            const hb_feature_t            *user_features,
            uint                   num_user_features,
            const int                     *coords,
            uint                   num_coords,
            const char * shaper_list)
        hb_shape_plan_create2;

//FIXME: const char * const *shaper_list,
    hb_shape_plan_t *
    function (
            hb_face_t                     *face,
            const hb_segment_properties_t *props,
            const hb_feature_t            *user_features,
            uint                   num_user_features,
            const int                     *coords,
            uint                   num_coords,
            const char * shaper_list)
        hb_shape_plan_create_cached2;


    hb_shape_plan_t *
    function ()
        hb_shape_plan_get_empty;

    hb_shape_plan_t *
    function (hb_shape_plan_t *shape_plan)
        hb_shape_plan_reference;

    void
    function (hb_shape_plan_t *shape_plan)
        hb_shape_plan_destroy;

    hb_bool_t
    function (
            hb_shape_plan_t    *shape_plan,
            hb_user_data_key_t *key,
            void *              data,
            hb_destroy_func_t   destroy,
            hb_bool_t           replace)
        hb_shape_plan_set_user_data;

    void *
    function (
            const hb_shape_plan_t *shape_plan,
            hb_user_data_key_t    *key)
        hb_shape_plan_get_user_data;


    hb_bool_t
    function (
            hb_shape_plan_t    *shape_plan,
            hb_font_t          *font,
            hb_buffer_t        *buffer,
            const hb_feature_t *features,
            uint        num_features)
        hb_shape_plan_execute;

    //FIXME: char *
    char *
    function (hb_shape_plan_t *shape_plan)
        hb_shape_plan_get_shaper;

}
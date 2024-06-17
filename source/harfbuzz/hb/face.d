/*
 * Adapted from hb-face.h by Grillo del Mal
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
 
 module harfbuzz.hb.face;

import harfbuzz.hb.common;
import harfbuzz.hb.blob;
import harfbuzz.hb.map;
import harfbuzz.hb.set;

nothrow @nogc:
extern (C):

__gshared {
    uint
    function (hb_blob_t *blob)
        hb_face_count;
}

/*
* hb_face_t
*/

/**
* hb_face_t:
*
* Data type for holding font faces.
*
**/
struct hb_face_t;

__gshared {
    hb_face_t *
    function (
            hb_blob_t    *blob,
            uint  index)
        hb_face_create;
}

/**
* hb_reference_table_func_t:
* @face: an #hb_face_t to reference table for
* @tag: the tag of the table to reference
* @user_data: User data pointer passed by the caller
*
* Callback function for hb_face_create_for_tables().
*
* Return value: (transfer full): A pointer to the @tag table within @face
*
* Since: 0.9.2
*/

alias hb_reference_table_func_t = 
    hb_blob_t * 
    function(hb_face_t *face, hb_tag_t tag, void *user_data);

__gshared {
    /* calls destroy() when not needing user_data anymore */
    hb_face_t *
    function (
            hb_reference_table_func_t  reference_table_func,
            void                      *user_data,
            hb_destroy_func_t          destroy)
        hb_face_create_for_tables;

    hb_face_t *
    function ()
        hb_face_get_empty;

    hb_face_t *
    function (hb_face_t *face)
        hb_face_reference;

    void
    function (hb_face_t *face)
        hb_face_destroy;

    hb_bool_t
    function (
            hb_face_t          *face,
            hb_user_data_key_t *key,
            void *              data,
            hb_destroy_func_t   destroy,
            hb_bool_t           replace)
        hb_face_set_user_data;

    void *
    function (
            const hb_face_t    *face,
            hb_user_data_key_t *key)
        hb_face_get_user_data;

    void
    function (hb_face_t *face)
        hb_face_make_immutable;

    hb_bool_t
    function (const hb_face_t *face)
        hb_face_is_immutable;


    hb_blob_t *
    function (
            const hb_face_t *face,
            hb_tag_t tag)
        hb_face_reference_table;

    hb_blob_t *
    function (hb_face_t *face)
        hb_face_reference_blob;

    void
    function (
            hb_face_t    *face,
            uint  index)
        hb_face_set_index;

    uint
    function (const hb_face_t *face)
        hb_face_get_index;

    void
    function (
            hb_face_t    *face,
            uint  upem)
        hb_face_set_upem;

    uint
    function (const hb_face_t *face)
        hb_face_get_upem;

    void
    function (
            hb_face_t    *face,
            uint  glyph_count)
        hb_face_set_glyph_count;

    uint
    function (const hb_face_t *face)
        hb_face_get_glyph_count;

    uint
    function (
            const hb_face_t *face,
            uint  start_offset,
            uint *table_count, /* IN/OUT */
            hb_tag_t     *table_tags /* OUT */)
        hb_face_get_table_tags;


    /*
    * Character set.
    */

    void
    function (
            hb_face_t *face,
            hb_set_t  *out_)
        hb_face_collect_unicodes;

    void
    function (
            hb_face_t *face,
            hb_map_t  *mapping,
            hb_set_t  *unicodes)
        hb_face_collect_nominal_glyph_mapping;

    void
    function (
            hb_face_t *face,
            hb_set_t  *out_)
        hb_face_collect_variation_selectors;

    void
    function (
            hb_face_t *face,
            hb_codepoint_t variation_selector,
            hb_set_t  *out_)
        hb_face_collect_variation_unicodes;


    /*
    * Builder face.
    */

    hb_face_t *
    function ()
        hb_face_builder_create;

    hb_bool_t
    function (
            hb_face_t *face,
            hb_tag_t   tag,
            hb_blob_t *blob)
        hb_face_builder_add_table;

    void
    function (
            hb_face_t *face,
            const hb_tag_t  *tags)
        hb_face_builder_sort_tables;

}


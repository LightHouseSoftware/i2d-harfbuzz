/*
 * Adapted from hb-buffer.h by Grillo del Mal
 *
 * Copyright © 1998-2004  David Turner and Werner Lemberg
 * Copyright © 2004,2007,2009  Red Hat, Inc.
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
 * Red Hat Author(s): Owen Taylor, Behdad Esfahbod
 * Google Author(s): Behdad Esfahbod
 */

module harfbuzz.funcs.hb.buffer;
import harfbuzz.types.hb.buffer;

import core.stdc.stdint;

import harfbuzz.types.hb.common;
import harfbuzz.types.hb.unicode;

nothrow @nogc:
extern (C):

__gshared {
    hb_bool_t
    function (
            const hb_segment_properties_t *a,
            const hb_segment_properties_t *b)
        hb_segment_properties_equal;

    uint
    function (const hb_segment_properties_t *p)
        hb_segment_properties_hash;

    void
    function (
            hb_segment_properties_t *p,
            const hb_segment_properties_t *src)
        hb_segment_properties_overlay;

    hb_buffer_t *
    function ()
        hb_buffer_create;

    hb_buffer_t *
    function (const hb_buffer_t *src)
        hb_buffer_create_similar;

    void
    function (hb_buffer_t *buffer)
        hb_buffer_reset;


    hb_buffer_t *
    function ()
        hb_buffer_get_empty;

    hb_buffer_t *
    function (hb_buffer_t *buffer)
        hb_buffer_reference;

    void
    function (hb_buffer_t *buffer)
        hb_buffer_destroy;

    hb_bool_t
    function (
            hb_buffer_t        *buffer,
            hb_user_data_key_t *key,
            void *              data,
            hb_destroy_func_t   destroy,
            hb_bool_t           replace)
        hb_buffer_set_user_data;

    void *
    function (
            const hb_buffer_t  *buffer,
            hb_user_data_key_t *key)
        hb_buffer_get_user_data;

    void
    function (
            hb_buffer_t              *buffer,
            hb_buffer_content_type_t  content_type)
        hb_buffer_set_content_type;

    hb_buffer_content_type_t
    function (const hb_buffer_t *buffer)
        hb_buffer_get_content_type;


    void
    function (
            hb_buffer_t        *buffer,
            hb_unicode_funcs_t *unicode_funcs)
        hb_buffer_set_unicode_funcs;

    hb_unicode_funcs_t *
    function (const hb_buffer_t  *buffer)
        hb_buffer_get_unicode_funcs;

    void
    function (
            hb_buffer_t    *buffer,
            hb_direction_t  direction)
        hb_buffer_set_direction;

    hb_direction_t
    function (const hb_buffer_t *buffer)
        hb_buffer_get_direction;

    void
    function (
            hb_buffer_t *buffer,
            hb_script_t  script)
        hb_buffer_set_script;

    hb_script_t
    function (const hb_buffer_t *buffer)
        hb_buffer_get_script;

    void
    function (
            hb_buffer_t   *buffer,
            hb_language_t  language)
        hb_buffer_set_language;


    hb_language_t
    function (const hb_buffer_t *buffer)
        hb_buffer_get_language;

    void
    function (
            hb_buffer_t *buffer,
            const hb_segment_properties_t *props)
        hb_buffer_set_segment_properties;

    void
    function (
            const hb_buffer_t *buffer,
            hb_segment_properties_t *props)
        hb_buffer_get_segment_properties;

    void
    function (hb_buffer_t *buffer)
        hb_buffer_guess_segment_properties;

    void
    function (
            hb_buffer_t       *buffer,
            hb_buffer_flags_t  flags)
        hb_buffer_set_flags;

    hb_buffer_flags_t
    function (const hb_buffer_t *buffer)
        hb_buffer_get_flags;

    void
    function (
            hb_buffer_t               *buffer,
            hb_buffer_cluster_level_t  cluster_level)
        hb_buffer_set_cluster_level;

    hb_buffer_cluster_level_t
    function (const hb_buffer_t *buffer)
        hb_buffer_get_cluster_level;

    void
    function (
            hb_buffer_t    *buffer,
            hb_codepoint_t  replacement)
        hb_buffer_set_replacement_codepoint;

    hb_codepoint_t
    function (const hb_buffer_t *buffer)
        hb_buffer_get_replacement_codepoint;

    void
    function (
            hb_buffer_t    *buffer,
            hb_codepoint_t  invisible)
        hb_buffer_set_invisible_glyph;

    hb_codepoint_t
    function (const hb_buffer_t *buffer)
        hb_buffer_get_invisible_glyph;

    void
    function (
            hb_buffer_t    *buffer,
            hb_codepoint_t  not_found)
        hb_buffer_set_not_found_glyph;

    hb_codepoint_t
    function (const hb_buffer_t *buffer)
        hb_buffer_get_not_found_glyph;

    void
    function (
            hb_buffer_t    *buffer,
            uint        state)
        hb_buffer_set_random_state;

    uint
    function (const hb_buffer_t *buffer)
        hb_buffer_get_random_state;

    /*
    * Content API.
    */

    void
    function (hb_buffer_t *buffer)
        hb_buffer_clear_contents;

    hb_bool_t
    function (
            hb_buffer_t  *buffer,
            uint  size)
        hb_buffer_pre_allocate;


    hb_bool_t
    function (hb_buffer_t  *buffer)
        hb_buffer_allocation_successful;

    void
    function (hb_buffer_t *buffer)
        hb_buffer_reverse;

    void
    function (
            hb_buffer_t *buffer,
            uint start, uint end)
        hb_buffer_reverse_range;

    void
    function (hb_buffer_t *buffer)
        hb_buffer_reverse_clusters;


    /* Filling the buffer in */

    void
    function (
            hb_buffer_t    *buffer,
            hb_codepoint_t  codepoint,
            uint    cluster)
        hb_buffer_add;

    void
    function (
            hb_buffer_t  *buffer,
            const char   *text,
            int           text_length,
            uint  item_offset,
            int           item_length)
        hb_buffer_add_utf8;

    void
    function (
            hb_buffer_t    *buffer,
            const uint16_t *text,
            int             text_length,
            uint    item_offset,
            int             item_length)
        hb_buffer_add_utf16;

    void
    function (
            hb_buffer_t    *buffer,
            const uint32_t *text,
            int             text_length,
            uint    item_offset,
            int             item_length)
        hb_buffer_add_utf32;

    void
    function (
            hb_buffer_t   *buffer,
            const uint8_t *text,
            int            text_length,
            uint   item_offset,
            int            item_length)
        hb_buffer_add_latin1;

    void
    function (
            hb_buffer_t          *buffer,
            const hb_codepoint_t *text,
            int                   text_length,
            uint          item_offset,
            int                   item_length)
        hb_buffer_add_codepoints;

    void
    function (
            hb_buffer_t *buffer,
            const hb_buffer_t *source,
            uint start,
            uint end)
        hb_buffer_append;

    hb_bool_t
    function (
            hb_buffer_t  *buffer,
            uint  length)
        hb_buffer_set_length;

    uint
    function (const hb_buffer_t *buffer)
        hb_buffer_get_length;

    /* Getting glyphs out of the buffer */

    hb_glyph_info_t *
    function (
            hb_buffer_t  *buffer,
            uint *length)
        hb_buffer_get_glyph_infos;

    hb_glyph_position_t *
    function (
            hb_buffer_t  *buffer,
            uint *length)
        hb_buffer_get_glyph_positions;

    hb_bool_t
    function (hb_buffer_t  *buffer)
        hb_buffer_has_positions;


    void
    function (hb_buffer_t *buffer)
        hb_buffer_normalize_glyphs;

    hb_buffer_serialize_format_t
    function (const char *str, int len)
        hb_buffer_serialize_format_from_string;

    //FIXME: const char *
    char *
    function (hb_buffer_serialize_format_t format)
        hb_buffer_serialize_format_to_string;

    //FIXME: const char **
    char **
    function ()
        hb_buffer_serialize_list_formats;

    uint
    function (
            hb_buffer_t *buffer,
            uint start,
            uint end,
            char *buf,
            uint buf_size,
            uint *buf_consumed,
            hb_font_t *font,
            hb_buffer_serialize_format_t format,
            hb_buffer_serialize_flags_t flags)
        hb_buffer_serialize_glyphs;

    uint
    function (
            hb_buffer_t *buffer,
            uint start,
            uint end,
            char *buf,
            uint buf_size,
            uint *buf_consumed,
            hb_buffer_serialize_format_t format,
            hb_buffer_serialize_flags_t flags)
        hb_buffer_serialize_unicode;

    uint
    function (
            hb_buffer_t *buffer,
            uint start,
            uint end,
            char *buf,
            uint buf_size,
            uint *buf_consumed,
            hb_font_t *font,
            hb_buffer_serialize_format_t format,
            hb_buffer_serialize_flags_t flags)
        hb_buffer_serialize;

    hb_bool_t
    function (
            hb_buffer_t *buffer,
            const char *buf,
            int buf_len,
            const char **end_ptr,
            hb_font_t *font,
            hb_buffer_serialize_format_t format)
        hb_buffer_deserialize_glyphs;

    hb_bool_t
    function (
            hb_buffer_t *buffer,
            const char *buf,
            int buf_len,
            const char **end_ptr,
            hb_buffer_serialize_format_t format)
        hb_buffer_deserialize_unicode;

    /* Compare the contents of two buffers, report types of differences. */
    hb_buffer_diff_flags_t
    function (
            hb_buffer_t *buffer,
            hb_buffer_t *reference,
            hb_codepoint_t dottedcircle_glyph,
            uint position_fuzz)
        hb_buffer_diff;

    void
    function (
            hb_buffer_t *buffer,
            hb_buffer_message_func_t func,
            void *user_data, hb_destroy_func_t destroy)
        hb_buffer_set_message_func;
}
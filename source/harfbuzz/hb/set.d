/*
 * Adapted from hb-set.h by Grillo del Mal
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
 
 module harfbuzz.hb.set;

import harfbuzz.hb.common;

nothrow @nogc:
extern (C):

/**
 * HB_SET_VALUE_INVALID:
 *
 * Unset #hb_set_t value.
 *
 * Since: 0.9.21
 */
enum HB_SET_VALUE_INVALID = HB_CODEPOINT_INVALID;

/**
 * hb_set_t:
 *
 * Data type for holding a set of integers. #hb_set_t's are
 * used to gather and contain glyph IDs, Unicode code
 * points, and various other collections of discrete 
 * values.
 *
 **/
struct hb_set_t;

__gshared {
    hb_set_t *
    function () 
        hb_set_create;

    hb_set_t *
    function () 
        hb_set_get_empty;

    hb_set_t *
    function (hb_set_t *set) 
        hb_set_reference;

    void
    function (hb_set_t *set)
        hb_set_destroy;

    hb_bool_t
    function (
            hb_set_t           *set,
            hb_user_data_key_t *key,
            void *              data,
            hb_destroy_func_t   destroy,
            hb_bool_t           replace)
        hb_set_set_user_data;

    void *
    function (
            const hb_set_t     *set,
            hb_user_data_key_t *key)
        hb_set_get_user_data;


    /* Returns false if allocation has failed before */
    hb_bool_t
    function (const hb_set_t *set)
        hb_set_allocation_successful;

    hb_set_t *
    function (const hb_set_t *set)
        hb_set_copy;

    void
    function (hb_set_t *set)
        hb_set_clear;

    hb_bool_t
    function (const hb_set_t *set)
        hb_set_is_empty;

    void
    function (hb_set_t *set)
        hb_set_invert;

    hb_bool_t
    function (const hb_set_t *set)
        hb_set_is_inverted;

    hb_bool_t
    function (const hb_set_t *set,
            hb_codepoint_t  codepoint)
        hb_set_has;

    void
    function (
            hb_set_t       *set,
            hb_codepoint_t  codepoint) 
        hb_set_add;

    void
    function (
            hb_set_t       *set,
            hb_codepoint_t  first,
            hb_codepoint_t  last) 
        hb_set_add_range;

    void
    function (
            hb_set_t             *set,
            const hb_codepoint_t *sorted_codepoints,
            uint          num_codepoints)
        hb_set_add_sorted_array;

    void
    function (
            hb_set_t       *set,
            hb_codepoint_t  codepoint)
        hb_set_del;

    void
    function (
            hb_set_t       *set,
            hb_codepoint_t  first,
            hb_codepoint_t  last)
        hb_set_del_range;

    hb_bool_t
    function (
            const hb_set_t *set,
            const hb_set_t *other)
        hb_set_is_equal;

    uint
    function (const hb_set_t *set)
            hb_set_hash;

    hb_bool_t
    function (
            const hb_set_t *set,
            const hb_set_t *larger_set)
        hb_set_is_subset;

    void
    function (
            hb_set_t       *set,
            const hb_set_t *other)
        hb_set_set;

    void
    function (
            hb_set_t       *set,
            const hb_set_t *other)
        hb_set_union;

    void
    function (
            hb_set_t       *set,
            const hb_set_t *other)
        hb_set_intersect;

    void
    function (
            hb_set_t       *set,
            const hb_set_t *other)
        hb_set_subtract;

    void
    function (
            hb_set_t       *set,
            const hb_set_t *other)
        hb_set_symmetric_difference;

    uint
    function (const hb_set_t *set)
        hb_set_get_population;

    /* Returns HB_SET_VALUE_INVALID if set empty. */
    hb_codepoint_t
    function (const hb_set_t *set)
        hb_set_get_min;

    /* Returns HB_SET_VALUE_INVALID if set empty. */
    hb_codepoint_t
    function (const hb_set_t *set)
        hb_set_get_max;

    /* Pass HB_SET_VALUE_INVALID in to get started. */
    hb_bool_t
    function (
            const hb_set_t *set,
            hb_codepoint_t *codepoint)
        hb_set_next;

    /* Pass HB_SET_VALUE_INVALID in to get started. */
    hb_bool_t
    function (
            const hb_set_t *set,
            hb_codepoint_t *codepoint)
        hb_set_previous;

    /* Pass HB_SET_VALUE_INVALID for first and last to get started. */
    hb_bool_t
    function (
            const hb_set_t *set,
            hb_codepoint_t *first,
            hb_codepoint_t *last)
        hb_set_next_range;

    /* Pass HB_SET_VALUE_INVALID for first and last to get started. */
    hb_bool_t
    function (
            const hb_set_t *set,
            hb_codepoint_t *first,
            hb_codepoint_t *last)
        hb_set_previous_range;

    /* Pass HB_SET_VALUE_INVALID in to get started. */
    //FIXME?: out variable renamed cos it's a keyword in Dlang
    uint
    function (
            const hb_set_t *set,
            hb_codepoint_t  codepoint,
            hb_codepoint_t *out_,
            uint    size)
        hb_set_next_many;
}
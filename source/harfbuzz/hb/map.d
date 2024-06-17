/*
 * Adapted from hb-map.h by Grillo del Mal
 *
 * Copyright © 2018  Google, Inc.
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
 
 module harfbuzz.hb.map;

import harfbuzz.hb.common;
import harfbuzz.hb.set;

nothrow @nogc:
extern (C):

/**
 * HB_MAP_VALUE_INVALID:
 *
 * Unset #hb_map_t value.
 *
 * Since: 1.7.7
 */
enum HB_MAP_VALUE_INVALID = HB_CODEPOINT_INVALID;

/**
 * hb_map_t:
 *
 * Data type for holding integer-to-integer hash maps.
 *
 **/
struct hb_map_t;

__gshared {
    hb_map_t *
    function ()
        hb_map_create;

    hb_map_t *
    function ()
        hb_map_get_empty;

    hb_map_t *
    function (hb_map_t *map)
        hb_map_reference;

    void
    function (hb_map_t *map) 
        hb_map_destroy;

    hb_bool_t
    function (
            hb_map_t           *map,
            hb_user_data_key_t *key,
            void *              data,
            hb_destroy_func_t   destroy,
            hb_bool_t           replace)
        hb_map_set_user_data;

    void *
    function (
            const hb_map_t     *map,
            hb_user_data_key_t *key)
        hb_map_get_user_data;


    /* Returns false if allocation has failed before */
    hb_bool_t
    function (const hb_map_t *map)
        hb_map_allocation_successful;

    hb_map_t *
    function (const hb_map_t *map)
        hb_map_copy;

    void
    function (hb_map_t *map)
        hb_map_clear;

    hb_bool_t
    function (const hb_map_t *map)
        hb_map_is_empty;

    uint
    function (const hb_map_t *map)
        hb_map_get_population;

    hb_bool_t
    function (
            const hb_map_t *map,
            const hb_map_t *other)
        hb_map_is_equal;

    uint
    function (const hb_map_t *map)
        hb_map_hash;

    void
    function (
            hb_map_t       *map,
            hb_codepoint_t  key,
            hb_codepoint_t  value)
        hb_map_set;

    hb_codepoint_t
    function (
            const hb_map_t *map,
            hb_codepoint_t  key)
        hb_map_get;

    void
    function (
            hb_map_t       *map,
            hb_codepoint_t  key)
        hb_map_del;

    hb_bool_t
    function (
            const hb_map_t *map,
            hb_codepoint_t  key)
        hb_map_has;

    void
    function (
            hb_map_t *map,
            const hb_map_t *other)
        hb_map_update;

    /* Pass -1 in for idx to get started. */
    hb_bool_t
    function (
            const hb_map_t *map,
            int *idx,
            hb_codepoint_t *key,
            hb_codepoint_t *value)
        hb_map_next;

    void
    function (
            const hb_map_t *map,
            hb_set_t *keys)
        hb_map_keys;

    void
    function (
            const hb_map_t *map,
            hb_set_t *values)
        hb_map_values;
}
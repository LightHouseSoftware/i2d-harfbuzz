/*
 * Adapted from hb-blob.h by Grillo del Mal
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

module harfbuzz.funcs.hb.blob;
import harfbuzz.types.hb.blob;

import harfbuzz.types.hb.common;

nothrow @nogc:
extern (C):

__gshared {
    hb_blob_t *
    function (
            const char      *data,
            uint               length,
            hb_memory_mode_t   mode,
            void              *user_data,
            hb_destroy_func_t  destroy)
        hb_blob_create;

    hb_blob_t *
    function (
            const char        *data,
            uint       length,
            hb_memory_mode_t   mode,
            void              *user_data,
            hb_destroy_func_t  destroy)
        hb_blob_create_or_fail;

    hb_blob_t *
    function (const char *file_name)
        hb_blob_create_from_file;

    hb_blob_t *
    function (const char *file_name)
        hb_blob_create_from_file_or_fail;

    /* Always creates with MEMORY_MODE_READONLY.
    * Even if the parent blob is writable, we don't
    * want the user of the sub-blob to be able to
    * modify the parent data as that data may be
    * shared among multiple sub-blobs.
    */
    hb_blob_t *
    function (
            hb_blob_t    *parent,
            uint  offset,
            uint  length)
        hb_blob_create_sub_blob;

    hb_blob_t *
    function (hb_blob_t *blob)
        hb_blob_copy_writable_or_fail;

    hb_blob_t *
    function ()
        hb_blob_get_empty;

    hb_blob_t *
    function (hb_blob_t *blob)
        hb_blob_reference;

    void
    function (hb_blob_t *blob)
        hb_blob_destroy;

    hb_bool_t
    function (
            hb_blob_t          *blob,
            hb_user_data_key_t *key,
            void *              data,
            hb_destroy_func_t   destroy,
            hb_bool_t           replace)
        hb_blob_set_user_data;


    void *
    function (
            const hb_blob_t    *blob,
            hb_user_data_key_t *key)
        hb_blob_get_user_data;


    void
    function (hb_blob_t *blob)
        hb_blob_make_immutable;

    hb_bool_t
    function (hb_blob_t *blob)
        hb_blob_is_immutable;


    uint
    function (hb_blob_t *blob)
        hb_blob_get_length;

    //FIXME: const char *
    char *
    function (hb_blob_t *blob, uint *length)
        hb_blob_get_data;

    char *
    function (hb_blob_t *blob, uint *length)
        hb_blob_get_data_writable;
}
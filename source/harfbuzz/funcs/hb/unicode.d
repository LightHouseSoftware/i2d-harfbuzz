/*
 * Adapted from hb-unicode.h by Grillo del Mal
 *
 * Copyright © 2009  Red Hat, Inc.
 * Copyright © 2011  Codethink Limited
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
 * Red Hat Author(s): Behdad Esfahbod
 * Codethink Author(s): Ryan Lortie
 * Google Author(s): Behdad Esfahbod
 */

module harfbuzz.funcs.hb.unicode;
import harfbuzz.types.hb.unicode;

import harfbuzz.types.hb.common;

nothrow @nogc:
extern (C):

__gshared {
    /*
    * just give me the best implementation you've got there.
    */
    hb_unicode_funcs_t *
    function ()
        hb_unicode_funcs_get_default;


    hb_unicode_funcs_t *
    function (hb_unicode_funcs_t *parent)
        hb_unicode_funcs_create;

    hb_unicode_funcs_t *
    function ()
        hb_unicode_funcs_get_empty;

    hb_unicode_funcs_t *
    function (hb_unicode_funcs_t *ufuncs)
        hb_unicode_funcs_reference;

    void
    function (hb_unicode_funcs_t *ufuncs)
        hb_unicode_funcs_destroy;

    hb_bool_t
    function (
            hb_unicode_funcs_t *ufuncs,
            hb_user_data_key_t *key,
            void *              data,
            hb_destroy_func_t   destroy,
            hb_bool_t           replace)
        hb_unicode_funcs_set_user_data;


    void *
    function (
            const hb_unicode_funcs_t *ufuncs,
            hb_user_data_key_t       *key)
        hb_unicode_funcs_get_user_data;


    void
    function (hb_unicode_funcs_t *ufuncs)
        hb_unicode_funcs_make_immutable;

    hb_bool_t
    function (hb_unicode_funcs_t *ufuncs)
        hb_unicode_funcs_is_immutable;

    hb_unicode_funcs_t *
    function (hb_unicode_funcs_t *ufuncs)
        hb_unicode_funcs_get_parent;

    /**
    * hb_unicode_funcs_set_combining_class_func:
    * @ufuncs: A Unicode-functions structure
    * @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
    * @user_data: Data to pass to @func
    * @destroy: (nullable): The function to call when @user_data is not needed anymore
    *
    * Sets the implementation function for #hb_unicode_combining_class_func_t.
    *
    * Since: 0.9.2
    **/
    void
    function (
            hb_unicode_funcs_t *ufuncs,
            hb_unicode_combining_class_func_t func,
            void *user_data, hb_destroy_func_t destroy)
        hb_unicode_funcs_set_combining_class_func;

    /**
    * hb_unicode_funcs_set_general_category_func:
    * @ufuncs: A Unicode-functions structure
    * @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
    * @user_data: Data to pass to @func
    * @destroy: (nullable): The function to call when @user_data is not needed anymore
    *
    * Sets the implementation function for #hb_unicode_general_category_func_t.
    *
    * Since: 0.9.2
    **/
    void
    function (
            hb_unicode_funcs_t *ufuncs,
            hb_unicode_general_category_func_t func,
            void *user_data, hb_destroy_func_t destroy)
        hb_unicode_funcs_set_general_category_func;

    /**
    * hb_unicode_funcs_set_mirroring_func:
    * @ufuncs: A Unicode-functions structure
    * @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
    * @user_data: Data to pass to @func
    * @destroy: (nullable): The function to call when @user_data is not needed anymore
    *
    * Sets the implementation function for #hb_unicode_mirroring_func_t.
    *
    * Since: 0.9.2
    **/
    void
    function (
            hb_unicode_funcs_t *ufuncs,
            hb_unicode_mirroring_func_t func,
            void *user_data, hb_destroy_func_t destroy)
        hb_unicode_funcs_set_mirroring_func;

    /**
    * hb_unicode_funcs_set_script_func:
    * @ufuncs: A Unicode-functions structure
    * @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
    * @user_data: Data to pass to @func
    * @destroy: (nullable): The function to call when @user_data is not needed anymore
    *
    * Sets the implementation function for #hb_unicode_script_func_t.
    *
    * Since: 0.9.2
    **/
    void
    function (
            hb_unicode_funcs_t *ufuncs,
            hb_unicode_script_func_t func,
            void *user_data, hb_destroy_func_t destroy)
        hb_unicode_funcs_set_script_func;

    /**
    * hb_unicode_funcs_set_compose_func:
    * @ufuncs: A Unicode-functions structure
    * @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
    * @user_data: Data to pass to @func
    * @destroy: (nullable): The function to call when @user_data is not needed anymore
    *
    * Sets the implementation function for #hb_unicode_compose_func_t.
    *
    * Since: 0.9.2
    **/
    void
    function (
            hb_unicode_funcs_t *ufuncs,
            hb_unicode_compose_func_t func,
            void *user_data, hb_destroy_func_t destroy)
        hb_unicode_funcs_set_compose_func;

    /**
    * hb_unicode_funcs_set_decompose_func:
    * @ufuncs: A Unicode-functions structure
    * @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
    * @user_data: Data to pass to @func
    * @destroy: (nullable): The function to call when @user_data is not needed anymore
    *
    * Sets the implementation function for #hb_unicode_decompose_func_t.
    *
    * Since: 0.9.2
    **/
    void
    function (
            hb_unicode_funcs_t *ufuncs,
            hb_unicode_decompose_func_t func,
            void *user_data, hb_destroy_func_t destroy)
        hb_unicode_funcs_set_decompose_func;

    /* accessors */

    /**
    * hb_unicode_combining_class:
    * @ufuncs: The Unicode-functions structure
    * @unicode: The code point to query
    *
    * Retrieves the Canonical Combining Class (ccc) property
    * of code point @unicode.
    *
    * Return value: The #hb_unicode_combining_class_t of @unicode
    *
    * Since: 0.9.2
    **/
    hb_unicode_combining_class_t
    function (
            hb_unicode_funcs_t *ufuncs,
            hb_codepoint_t unicode)
        hb_unicode_combining_class;

    /**
    * hb_unicode_general_category:
    * @ufuncs: The Unicode-functions structure
    * @unicode: The code point to query
    *
    * Retrieves the General Category (gc) property
    * of code point @unicode.
    *
    * Return value: The #hb_unicode_general_category_t of @unicode
    *
    * Since: 0.9.2
    **/
    hb_unicode_general_category_t
    function (
            hb_unicode_funcs_t *ufuncs,
            hb_codepoint_t unicode)
        hb_unicode_general_category;

    /**
    * hb_unicode_mirroring:
    * @ufuncs: The Unicode-functions structure
    * @unicode: The code point to query
    *
    * Retrieves the Bi-directional Mirroring Glyph code
    * point defined for code point @unicode.
    *
    * Return value: The #hb_codepoint_t of the Mirroring Glyph for @unicode
    *
    * Since: 0.9.2
    **/
    hb_codepoint_t
    function (
            hb_unicode_funcs_t *ufuncs,
            hb_codepoint_t unicode)
        hb_unicode_mirroring;

    /**
    * hb_unicode_script:
    * @ufuncs: The Unicode-functions structure
    * @unicode: The code point to query
    *
    * Retrieves the #hb_script_t script to which code
    * point @unicode belongs.
    *
    * Return value: The #hb_script_t of @unicode
    *
    * Since: 0.9.2
    **/
    hb_script_t
    function (
            hb_unicode_funcs_t *ufuncs,
            hb_codepoint_t unicode)
        hb_unicode_script;

    hb_bool_t
    function (
            hb_unicode_funcs_t *ufuncs,
            hb_codepoint_t      a,
            hb_codepoint_t      b,
            hb_codepoint_t     *ab)
        hb_unicode_compose;

    hb_bool_t
    function (
            hb_unicode_funcs_t *ufuncs,
            hb_codepoint_t      ab,
            hb_codepoint_t     *a,
            hb_codepoint_t     *b)
        hb_unicode_decompose;
}
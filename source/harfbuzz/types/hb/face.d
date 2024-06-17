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
 
module harfbuzz.types.hb.face;

import harfbuzz.types.hb.common;
import harfbuzz.types.hb.blob;
import harfbuzz.types.hb.map;
import harfbuzz.types.hb.set;

nothrow @nogc:
extern (C):

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

module harfbuzz.features.hb.hb_ft;

import harfbuzz.types.hb.common;
import harfbuzz.types.hb.font;
import harfbuzz.types.hb.face;

import bindbc.freetype; // For FT_Face

nothrow @nogc:
extern (C):

__gshared
{
    /**
     * hb_ft_face_create:
     * Creates an hb_face from an FT_Face.
     */
    hb_face_t* function(FT_Face ft_face, hb_destroy_func_t destroy)
    hb_ft_face_create;

    /**
     * hb_ft_face_create_cached:
     * Creates an hb_face with caching based on FT_Face.
     */
    hb_face_t* function(FT_Face ft_face)
    hb_ft_face_create_cached;

    /**
     * hb_ft_face_create_referenced:
     * Creates an hb_face and increments the reference count for FT_Face.
     */
    hb_face_t* function(FT_Face ft_face)
    hb_ft_face_create_referenced;

    /**
     * hb_ft_face_create_from_file_or_fail:
     * Creates an hb_face by loading a font from a file.
     */
    hb_face_t* function(const(char)* file_name, uint index)
    hb_ft_face_create_from_file_or_fail;

    /**
     * hb_ft_font_create:
     * Creates an hb_font from an FT_Face.
     */
    hb_font_t* function(FT_Face ft_face, hb_destroy_func_t destroy)
    hb_ft_font_create;

    /**
     * hb_ft_font_create_referenced:
     * Creates an hb_font and increments the reference count for FT_Face.
     */
    hb_font_t* function(FT_Face ft_face)
    hb_ft_font_create_referenced;

    /**
     * hb_ft_font_get_face:
     * Gets the FT_Face from an hb_font.
     */
    FT_Face
    function(hb_font_t* font)
    hb_ft_font_get_face;

    /**
     * hb_ft_font_lock_face:
     * Locks and retrieves the FT_Face from an hb_font.
     */
    FT_Face
    function(hb_font_t* font)
    hb_ft_font_lock_face;

    /**
     * hb_ft_font_unlock_face:
     * Unlocks the FT_Face from an hb_font.
     */
    void function(hb_font_t* font)
    hb_ft_font_unlock_face;

    /**
     * hb_ft_font_set_load_flags:
     * Sets load flags for an hb_font.
     */
    void function(hb_font_t* font, int load_flags)
    hb_ft_font_set_load_flags;

    /**
     * hb_ft_font_get_load_flags:
     * Gets the load flags for an hb_font.
     */
    int function(hb_font_t* font)
    hb_ft_font_get_load_flags;

    /**
     * hb_ft_font_changed:
     * Notifies HarfBuzz that the FT_Face has changed.
     */
    void function(hb_font_t* font)
    hb_ft_font_changed;

    /**
     * hb_ft_hb_font_changed:
     * Notifies FreeType that the hb_font has changed.
     * Returns true if changes occurred.
     */
    hb_bool_t
    function(hb_font_t* font)
    hb_ft_hb_font_changed;

    /**
     * hb_ft_font_set_funcs:
     * Sets FreeType as the implementation for font functions in hb_font.
     */
    void function(hb_font_t* font)
    hb_ft_font_set_funcs;
}
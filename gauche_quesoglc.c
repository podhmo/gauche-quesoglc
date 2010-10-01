/*
 * gauche_quesoglc.c
 */

#include "gauche_quesoglc.h"

/*
 * The following function is a dummy one; replace it for
 * your C function definitions.
 */

ScmObj test_gauche_quesoglc(void)
{
    return SCM_MAKE_STR("gauche_quesoglc is working");
}

/*
 * Module initialization function.
 */
extern void Scm_Init_gauche_quesoglclib(ScmModule*);

void Scm_Init_gauche_quesoglc(void)
{
    ScmModule *mod;

    /* Register this DSO to Gauche */
    SCM_INIT_EXTENSION(gauche_quesoglc);

    /* Create the module if it doesn't exist yet. */
    mod = SCM_MODULE(SCM_FIND_MODULE("gl.glc", TRUE));

    /* Register stub-generated procedures */
    Scm_Init_gauche_quesoglclib(mod);
}

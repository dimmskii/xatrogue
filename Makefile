###############################################
### KMQuake2 Missionpack game-only Makefile ###
### Made from modified OpenTDM makefile by: ###
### Dimmskii aka LedZep                     ###
###############################################

ifneq (,$(findstring libc6,$(shell if [ -e /lib/libc.so.6* ];then echo libc6;fi)))
GLIBC=-glibc
else
GLIBC=
endif


# this nice line comes from the linux kernel makefile
ARCH := $(shell uname -m | sed -e s/i.86/i386/ -e s/sun4u/sparc/ -e s/sparc64/sparc/ -e s/arm.*/arm/ -e s/sa110/arm/ -e s/alpha/axp/)
RPMARCH=$(ARCH)
ifneq (,$(findstring alpha,$(shell uname -m)))
ARCH=axp
RPMARCH=alpha
endif
NOARCH=noarch

MOUNT_DIR=.
SRC_DIR=$(MOUNT_DIR)/src
BUILD_DIR=$(MOUNT_DIR)


CC=gcc
BASE_CFLAGS=
DEBUG_CFLAGS=$(BASE_CFLAGS) -g
LDFLAGS=-ldl -lm


SHLIBEXT=so

SHLIBCFLAGS=-fPIC -Dstricmp=strcasecmp -Wall
SHLIBLDFLAGS=-shared

DO_SHLIB_CC=$(CC) $(CFLAGS) $(SHLIBCFLAGS) -o $@ -c $<
DO_SHLIB_O_CC=$(CC) $(CFLAGS) -O $(SHLIBCFLAGS) -o $@ -c $<
DO_SHLIB_DEBUG_CC=$(CC) $(DEBUG_CFLAGS) $(SHLIBCFLAGS) -o $@ -c $<
DO_AS=$(CC) $(CFLAGS) -DELF -x assembler-with-cpp -o $@ -c $<
DO_SHLIB_AS=$(CC) $(CFLAGS) $(SHLIBCFLAGS) -DELF -x assembler-with-cpp -o $@ -c $<


OBJS = \
	$(BUILD_DIR)/dm_ball.o \
	$(BUILD_DIR)/dm_tag.o \
	$(BUILD_DIR)/g_ai.o \
	$(BUILD_DIR)/g_camera.o \
	$(BUILD_DIR)/g_chase.o \
	$(BUILD_DIR)/g_cmds.o \
	$(BUILD_DIR)/g_combat.o \
	$(BUILD_DIR)/g_crane.o \
	$(BUILD_DIR)/g_fog.o \
	$(BUILD_DIR)/g_func.o \
	$(BUILD_DIR)/g_items.o \
	$(BUILD_DIR)/g_jetpack.o \
	$(BUILD_DIR)/g_lights.o \
	$(BUILD_DIR)/g_lock.o \
	$(BUILD_DIR)/g_main.o \
	$(BUILD_DIR)/g_mappack.o \
	$(BUILD_DIR)/g_misc.o \
	$(BUILD_DIR)/g_monster.o \
	$(BUILD_DIR)/g_newai.o \
	$(BUILD_DIR)/g_newdm.o \
	$(BUILD_DIR)/g_newfnc.o \
	$(BUILD_DIR)/g_newtarg.o \
	$(BUILD_DIR)/g_newtrig.o \
	$(BUILD_DIR)/g_newweap.o \
	$(BUILD_DIR)/g_patchplayermodels.o \
	$(BUILD_DIR)/g_pendulum.o \
	$(BUILD_DIR)/g_phys.o \
	$(BUILD_DIR)/g_save.o \
	$(BUILD_DIR)/g_spawn.o \
	$(BUILD_DIR)/g_sphere.o \
	$(BUILD_DIR)/g_svcmds.o \
	$(BUILD_DIR)/g_target.o \
	$(BUILD_DIR)/g_thing.o \
	$(BUILD_DIR)/g_tracktrain.o \
	$(BUILD_DIR)/g_trigger.o \
	$(BUILD_DIR)/g_turret.o \
	$(BUILD_DIR)/g_utils.o \
	$(BUILD_DIR)/g_vehicle.o \
	$(BUILD_DIR)/g_weapon.o \
	$(BUILD_DIR)/grenade.o \
	$(BUILD_DIR)/km_cvar.o \
	$(BUILD_DIR)/m_actor.o \
	$(BUILD_DIR)/m_actor_weap.o \
	$(BUILD_DIR)/m_berserk.o \
	$(BUILD_DIR)/m_boss2.o \
	$(BUILD_DIR)/m_boss3.o \
	$(BUILD_DIR)/m_boss31.o \
	$(BUILD_DIR)/m_boss32.o \
	$(BUILD_DIR)/m_boss5.o \
	$(BUILD_DIR)/m_brain.o \
	$(BUILD_DIR)/m_brainbeta.o \
	$(BUILD_DIR)/m_carrier.o \
	$(BUILD_DIR)/m_chick.o \
	$(BUILD_DIR)/m_dog.o \
	$(BUILD_DIR)/m_fixbot.o \
	$(BUILD_DIR)/m_flash.o \
	$(BUILD_DIR)/m_flipper.o \
	$(BUILD_DIR)/m_float.o \
	$(BUILD_DIR)/m_flyer.o \
	$(BUILD_DIR)/m_gekk.o \
	$(BUILD_DIR)/m_gladb.o \
	$(BUILD_DIR)/m_gladiator.o \
	$(BUILD_DIR)/m_gunner.o \
	$(BUILD_DIR)/m_hover.o \
	$(BUILD_DIR)/m_infantry.o \
	$(BUILD_DIR)/m_insane.o \
	$(BUILD_DIR)/m_medic.o \
	$(BUILD_DIR)/m_move.o \
	$(BUILD_DIR)/m_mutant.o \
	$(BUILD_DIR)/m_parasite.o \
	$(BUILD_DIR)/m_soldier.o \
	$(BUILD_DIR)/m_stalker.o \
	$(BUILD_DIR)/m_supertank.o \
	$(BUILD_DIR)/m_tank.o \
	$(BUILD_DIR)/m_turret.o \
	$(BUILD_DIR)/m_widow.o \
	$(BUILD_DIR)/m_widow2.o \
	$(BUILD_DIR)/z_anim.o \
	$(BUILD_DIR)/z_sentien.o \
	$(BUILD_DIR)/p_chasecam.o \
	$(BUILD_DIR)/p_client.o \
	$(BUILD_DIR)/p_hud.o \
	$(BUILD_DIR)/p_menu.o \
	$(BUILD_DIR)/p_text.o \
	$(BUILD_DIR)/p_trail.o \
	$(BUILD_DIR)/p_view.o \
	$(BUILD_DIR)/p_weapon.o \
	$(BUILD_DIR)/q_shared.o


$(BUILD_DIR)/game$(ARCH).$(SHLIBEXT) : $(OBJS)
	$(CC) $(CFLAGS) $(SHLIBLDFLAGS) -o $@ $(OBJS)

$(BUILD_DIR)/dm_ball.o :      $(SRC_DIR)/dm_ball.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/dm_tag.o :       $(SRC_DIR)/dm_tag.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/g_ai.o :         $(SRC_DIR)/g_ai.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/g_camera.o :      	$(SRC_DIR)/g_camera.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/g_chase.o :      $(SRC_DIR)/g_chase.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/g_cmds.o :       $(SRC_DIR)/g_cmds.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/g_combat.o :     $(SRC_DIR)/g_combat.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/g_crane.o :      	$(SRC_DIR)/g_crane.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/g_fog.o :      	$(SRC_DIR)/g_fog.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/g_func.o :       $(SRC_DIR)/g_func.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/g_items.o :      $(SRC_DIR)/g_items.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/g_jetpack.o :      $(SRC_DIR)/g_jetpack.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/g_lights.o :      $(SRC_DIR)/g_lights.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/g_lock.o :      $(SRC_DIR)/g_lock.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/g_main.o :	$(SRC_DIR)/g_main.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/g_mappack.o :	$(SRC_DIR)/g_mappack.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/g_misc.o :	$(SRC_DIR)/g_misc.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/g_monster.o :    $(SRC_DIR)/g_monster.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/g_newai.o :      $(SRC_DIR)/g_newai.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/g_newdm.o :      $(SRC_DIR)/g_newdm.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/g_newfnc.o :     $(SRC_DIR)/g_newfnc.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/g_newtarg.o :    $(SRC_DIR)/g_newtarg.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/g_newtrig.o :    $(SRC_DIR)/g_newtrig.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/g_newweap.o :    $(SRC_DIR)/g_newweap.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/g_patchplayermodels.o :    $(SRC_DIR)/g_patchplayermodels.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/g_pendulum.o :    $(SRC_DIR)/g_pendulum.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/g_phys.o :	$(SRC_DIR)/g_phys.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/g_save.o :	$(SRC_DIR)/g_save.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/g_spawn.o :      $(SRC_DIR)/g_spawn.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/g_sphere.o :     $(SRC_DIR)/g_sphere.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/g_svcmds.o :     $(SRC_DIR)/g_svcmds.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/g_target.o :     $(SRC_DIR)/g_target.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/g_thing.o :      	$(SRC_DIR)/g_thing.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/g_tracktrain.o :      	$(SRC_DIR)/g_tracktrain.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/g_trigger.o :    $(SRC_DIR)/g_trigger.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/g_turret.o :     $(SRC_DIR)/g_turret.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/g_utils.o :      $(SRC_DIR)/g_utils.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/g_vehicle.o :      $(SRC_DIR)/g_vehicle.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/g_weapon.o :     $(SRC_DIR)/g_weapon.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/grenade.o :     $(SRC_DIR)/grenade.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/km_cvar.o :      	$(SRC_DIR)/km_cvar.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/m_actor.o :      $(SRC_DIR)/m_actor.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/m_actor_weap.o :      $(SRC_DIR)/m_actor_weap.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/m_berserk.o :    $(SRC_DIR)/m_berserk.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/m_boss2.o :      $(SRC_DIR)/m_boss2.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/m_boss3.o :      $(SRC_DIR)/m_boss3.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/m_boss31.o :     $(SRC_DIR)/m_boss31.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/m_boss32.o :     $(SRC_DIR)/m_boss32.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/m_boss5.o :     $(SRC_DIR)/m_boss5.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/m_brain.o :      $(SRC_DIR)/m_brain.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/m_brainbeta.o :      $(SRC_DIR)/m_brainbeta.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/m_carrier.o :    $(SRC_DIR)/m_carrier.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/m_chick.o :      $(SRC_DIR)/m_chick.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/m_dog.o :      $(SRC_DIR)/m_dog.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/m_fixbot.o :    $(SRC_DIR)/m_fixbot.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/m_flash.o :      $(SRC_DIR)/m_flash.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/m_flipper.o :    $(SRC_DIR)/m_flipper.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/m_float.o :      $(SRC_DIR)/m_float.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/m_flyer.o :      $(SRC_DIR)/m_flyer.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/m_gekk.o :      $(SRC_DIR)/m_gekk.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/m_gladb.o :     $(SRC_DIR)/m_gladb.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/m_gladiator.o :  $(SRC_DIR)/m_gladiator.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/m_gunner.o :     $(SRC_DIR)/m_gunner.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/m_hover.o :      $(SRC_DIR)/m_hover.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/m_infantry.o :   $(SRC_DIR)/m_infantry.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/m_insane.o :     $(SRC_DIR)/m_insane.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/m_medic.o :      $(SRC_DIR)/m_medic.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/m_move.o :	$(SRC_DIR)/m_move.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/m_mutant.o :     $(SRC_DIR)/m_mutant.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/m_parasite.o :   $(SRC_DIR)/m_parasite.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/m_soldier.o :    $(SRC_DIR)/m_soldier.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/m_stalker.o :    $(SRC_DIR)/m_stalker.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/m_supertank.o :  $(SRC_DIR)/m_supertank.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/m_tank.o :	$(SRC_DIR)/m_tank.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/m_turret.o :     $(SRC_DIR)/m_turret.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/m_widow.o :      $(SRC_DIR)/m_widow.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/m_widow2.o :     $(SRC_DIR)/m_widow2.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/z_anim.o :     $(SRC_DIR)/z_anim.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/z_sentien.o :     $(SRC_DIR)/z_sentien.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/p_chasecam.o :     $(SRC_DIR)/p_chasecam.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/p_client.o :     $(SRC_DIR)/p_client.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/p_hud.o :	 $(SRC_DIR)/p_hud.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/p_menu.o :	 $(SRC_DIR)/p_menu.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/p_text.o :	 $(SRC_DIR)/p_text.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/p_trail.o :      $(SRC_DIR)/p_trail.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/p_view.o :	$(SRC_DIR)/p_view.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/p_weapon.o :     $(SRC_DIR)/p_weapon.c
	$(DO_SHLIB_CC)

$(BUILD_DIR)/q_shared.o :     $(SRC_DIR)/q_shared.c
	$(DO_SHLIB_CC)

#############################################################################
# MISC
#############################################################################

clean:
	-rm -f $(OBJS)

/*
 * PrecisionLaserKnifeImplementation.cpp
 *
 *  Created on: Mar 8, 2011
 *      Author: polonel
 */

#include "server/zone/objects/tangible/tool/smuggler/PrecisionLaserKnife.h"
#include "server/zone/packets/scene/AttributeListMessage.h"
#include "server/zone/ZoneServer.h"
#include "server/zone/objects/player/sessions/SlicingSession.h"
#include "server/zone/objects/region/CityRegion.h"
#include "server/zone/objects/tangible/terminal/mission/MissionTerminal.h"
#include "server/zone/managers/gcw/GCWManager.h"
#include "server/zone/Zone.h"

int PrecisionLaserKnifeImplementation::handleObjectMenuSelect(CreatureObject* player, byte selectedID) {

	if (!isASubChildOf(player))
		return 0;

	if(!player->hasSkill("combat_smuggler_novice")){
		player->sendSystemMessage("You must be at least a Novice Smuggler to use this tool.");
		return 0;
	}

	if (selectedID != 20)
		return TangibleObjectImplementation::handleObjectMenuSelect(player, selectedID);

	uint64 targetID = player->getTargetID();
	ZoneServer* zs = player->getZoneServer();
	ManagedReference<TangibleObject*> target = zs->getObject(targetID, true).castTo<TangibleObject*>();

	if (target == nullptr || (!target->isSliceable() && !target->isSecurityTerminal())) {
		player->sendSystemMessage("You cannot slice that.");
		return 0;
	}

	if (target->isMissionTerminal()) {
		if (player->getSkillMod("slicing") < 15) {  //Infinity:  Skillmod check instead of skill box
			return 0;
		}

		MissionTerminal* terminal = target.castTo<MissionTerminal*>();

		if (terminal == nullptr || terminal->isBountyTerminal())
			return 0;

		ManagedReference<CityRegion*> city = player->getCityRegion().get();
		if (city != nullptr && !city->isClientRegion() && city->isBanned(player->getObjectID())) {
			player->sendSystemMessage("@city/city:banned_services"); // You are banned from using this city's services.
			return 0;
		}

		if (!player->checkCooldownRecovery("slicing.terminal")) {
			StringIdChatParameter message;
			message.setStringId("@slicing/slicing:not_yet"); // You will be able to hack the network again in %DI seconds.
			message.setDI(player->getCooldownTime("slicing.terminal")->getTime() - Time().getTime());
			player->sendSystemMessage(message);
			return 0;
		}

	} else if (target->isWeaponObject() && player->getSkillMod("slicing") < 25) {   // Infinity:  Skillmod check instead of skill
		return 0;
	} else if (target->isArmorObject() && player->getSkillMod("slicing") < 35) {  // Infinity:  Skillmod check instead of skill
		return 0;
	} else if (target->isSecurityTerminal()) {
		Zone* zone = target->getZone();
		if (zone == nullptr)
			return 0;

		GCWManager* gcwMan = zone->getGCWManager();
		if (gcwMan == nullptr)
			return 0;

		if (!gcwMan->canStartSlice(player, target))
			return 0;

		if (gcwMan->isTerminalDamaged(target)) {
			player->sendSystemMessage("@hq:terminal_disabled"); // This terminal has been disabled. Repair the objectives to reactivate.
			return 0;
		}
	}

	if (target->isSliced()) {
		player->sendSystemMessage("@slicing/slicing:already_sliced");
		return 0;
	}

	if (player->containsActiveSession(SessionFacadeType::SLICING)) {
		player->sendSystemMessage("@slicing/slicing:already_slicing");
		return 0;
	}

	//Create Session
	ManagedReference<SlicingSession*> session = new SlicingSession(player);

	if (target->isSecurityTerminal())
		session->setBaseSlice(true);

	session->initalizeSlicingMenu(player, target);

	return 0;
}

void PrecisionLaserKnifeImplementation::fillAttributeList(AttributeListMessage* alm, CreatureObject* object) {
	SlicingToolImplementation::fillAttributeList(alm, object);

	alm->insertAttribute("charges", charges);
}

void PrecisionLaserKnifeImplementation::updateCharges(int val) {
	charges = val;
	AttributeListMessage* msg = new AttributeListMessage(getObjectID());
	msg->insertAttribute("charges", charges);
	broadcastMessage(msg, false);
}

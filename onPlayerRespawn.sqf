//========== Player Death Fix ========== 
if (lifeState _player != "HEALTHY") then
{
    [_player, "", 1] spawn TLS_fnc_Player_Drag;
    _player allowDamage false;
    [_player, _corpse] spawn 
    {    params ["_player", "_corpse"];
        //private _posofdeath = [_corpse, 0, 20, 0.5, 0, 0, 0] call BIS_fnc_findSafePos;
        private _posofdeath = getpos _corpse;
        deletevehicle _corpse;    
        _player setPos _posofdeath;
        _player setdamage  0.8;
        _player setUnconscious true;                                    
        [_player] call bis_fnc_reenableRevive;
        sleep 0.5;                
        _player allowDamage true;
    };    
};

/*
	Upon respawn, check to make sure not respawning in bad place
		private _centerposition = [worldSize / 2, worldsize / 2, 0];
        private _goodlanding = [_player, 10, 150, 20, 0, 8, 0] call BIS_fnc_findSafePos;
        if !(_centerposition  isEqualTo _goodlanding) then

	Once incapacitated, make player invincible
	Not be able to respawn for 30 minutes |OR| All respawns take you to where you were when you died
	Incapacitated until medic

	Take examples from 77th
*/
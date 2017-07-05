event_inherited();

name = "Bill";

class = "Fighter";
race = "Dwarf";

// character statistics
level = 1;
profMod = 2 + floor(level/5);

//base stats
strMod = 3;
dexMod = 0;
conMod = 2;
intMod = 0;
wisMod = 1;
chaMod = 0;

//health variables
maxHitPoints = 10 + conMod + ((level - 1)*(6 + conMod));
hitPoints = maxHitPoints;

//attack variables
hitBonus = profMod + strMod;
attackType = "melee";
attackTarget = noone;
attackTimer = 0;

//damage variables
damageDice = 10;
damageBonus = strMod;
damageType = "slashing";

//defence variables
armourClass = 18;

//move and actions variables
move = 5;
actions = 2;

//initiative
initiative = dexMod;
initRoll = 0;
waitUntil { !isNil {player} };
waitUntil { player == player };

switch (side player) do 
{
case WEST: // BLUFOR briefing goes here
{
player createDiaryRecord ["Diary", ["Rules Of Engagement","[[SSGT KuuHomi 10 Rules Of Engagement]]<br/><br/>Rule #1 - Don't get shot.<br/>Rule #2 - Short, controlled bursts.<br/>Rule #3 - Be proud you are a Marine.<br/>Rule #4 - Watch your bullet drop.<br/>Rule #5 - Patch your wounds.<br/>Rule #6 - Keep a full mag.<br/>Rule #7 - If in doubt, fall back.<br/>Rule #8 - Keep the enemy suppressed.<br/>Rule #9 - Follow orders.<br/>Rule #10 - Beware of confined spaces."]];
//player createDiaryRecord["Diary", ["Diary",""]];

};

case EAST: // OPFOR briefing goes here
{ 
};


case RESISTANCE: // RESISTANCE/INDEPENDENT briefing goes here
{ 
};


case CIVILIAN: // CIVILIAN briefing goes here
{ 
};
};

waitUntil { (isServer || !isNull player) };

[playerSide, "HQ"] commandChat "Briefing Done!";

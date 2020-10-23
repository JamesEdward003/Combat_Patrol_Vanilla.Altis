bon_recruit_barracks = _this select 0;
_caller = _this select 1;
_id = _this select 2;
_caller removeAction _id;

createDialog "RecruitUnitsDialog";
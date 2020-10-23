//////////  execVM "nameTags.sqf";  ///////////
{
    _x setVariable ["tag", _x addAction ["", "", "", 0, false, false, "", "
        if (!alive _target) exitWith {
            _target removeAction (_target getVariable 'tag');
        };
        if (
            cameraView != 'EXTERNAL' && 
            {_target == vehicle _this}
        ) exitWith {};
        _crew = {alive _x} count crew _target;
        if (_crew == 0) exitWith {};
        _color = getArray (configFile/'CfgInGameUI'/'SideColors'/call {
            if (side _target getFriend playerSide < 0.5) then [
                {'colorEnemy'},
                {'colorFriendly'}
            ]
        });
        _color set [3, 1 - (_this distance _target) / 15];
        drawIcon3D [
            '',
            _color,
            [
                visiblePosition _target select 0,
                visiblePosition _target select 1,
                (visiblePosition _target select 2) + 
                (boundingBox _target select 1 select 2) * 1.5
            ],
            0,
            0,
            0,
            name (crew _target select 0) + (
                if (_crew > 1) then [
                    {format [' + %1', _crew - 1]},
                    {''}
                ]
            ),
            2,
            0.04,
            'PuristaMedium'
        ];
        false
    "]];
} forEach vehicles;

{
    _x setVariable ["tag", _x addAction ["", "", "", 0, false, false, "", "
        if (!alive _target) exitWith {
            _target removeAction (_target getVariable 'tag');
        };
        _dist = (_this distance _target) / 15;
        _color = getArray (configFile/'CfgInGameUI'/'SideColors'/call {
            if (playerSide getFriend side _target < 0.5) then [
                {'colorEnemy'},
                {'colorFriendly'}
            ]
        });
        _color set [3, 1 - _dist];
        drawIcon3D [
            '',
            _color,
            [
                visiblePosition _target select 0,
                visiblePosition _target select 1,
                (visiblePosition _target select 2) + 
                ((_target modelToWorld (
                    _target selectionPosition 'head'
                )) select 2) + 0.4 + _dist / 1.5
            ],
            0,
            0,
            0,
            name _target,
            2,
            0.03,
            'PuristaMedium'
        ];
        false
    "]];
} forEach (allUnits - [player]);
// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function NewEncounter(_enemies, _bg)
{
	instance_create_depth
	(
		camera_get_view_x(view_camera[0]),
		camera_get_view_y(view_camera[0]),
		-9999,
		obj_battle,
		{enemies: _enemies, creator: id, battleBackground: _bg}
	);
}

function BattleChangeHP(_target, _amount, _alive_dead_or_either = 0)
{
	//_alive_dead_or_either: 0 = vivo apenas, 1 = morto apenas, 2 = qualquer um
	var _failed = false;
	if (_alive_dead_or_either == 0) && (_target.hp <= 0) _failed = true;
	
	var _col = c_white;
	if (_amount > 0) _col = c_lime;
	if (_failed)
	{
		_col = c_white;
		_amount = "failed";
	}
	instance_create_depth
	(
		_target.x,
		_target.y,
		_target.depth-1,
		obj_battle_floating_text,
		{font: fnM5x7, col: _col, text: string(_amount)}
	);
	if (!_failed) _target.hp = clamp(_target.hp + _amount, 0, _target.hpMax);
}

function BattleChangeMP(_user, _mp_cost)
{
	_user.mp -= _mp_cost;
}

function AllDead(_unit)
{
	for (var i = 0; i < array_length(_unit); i++)
	{
		//se tiver ao menos uma unidade viva ele vai retornar essa função como falsa
		if (_unit[i].hp > 0)
		{
			return false;	
		}
	}
	//caso contrário todos estão realmente mortos
	return true;
}

function AtualizarHpGlobal() {
    for (var i = 0; i < array_length(partyUnidades); i++) {
        var _unidade = partyUnidades[i];
        global.party[i].hp = _unidade.hp;
    }
}

function AtualizarMpGlobal() {
    for (var i = 0; i < array_length(partyUnidades); i++) {
        var _unidade = partyUnidades[i];
        global.party[i].mp = _unidade.mp;
    }
}
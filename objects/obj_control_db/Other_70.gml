/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if async_load[? "status"] == 200
{
	switch (async_load[? "type"])
	{
		case "FirebaseFirestore_Collection_Listener":
			FirebaseFirestore(root).Query();
			break;
			
		case "FirebaseFirestore_Collection_Query":
			data = [];
			
			var _doc = async_load[? "value"];
			var _data = json_parse(_doc);
			var _names = variable_struct_get_names(_data);
			
			for (var i = 0; i < array_length(_names); i++)
			{
				var _doc = variable_struct_get(_data, _names[i]);
				_doc.id = _names[i];
				array_push(data, _doc);
			}
			
			array_sort(data, sort_score);
			break;
	}
}
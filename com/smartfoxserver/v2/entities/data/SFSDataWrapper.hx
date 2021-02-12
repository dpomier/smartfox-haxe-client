package com.smartfoxserver.v2.entities.data;

/**
 * @private
 * 
 * A wrapper object used by SFSObject and SFSArray to encapsulate data and relative types.
 */
abstract SFSDataWrapper (#if js SFSDataWrapperJs #else SFSDataWrapperNative #end)
{
	public var type (get,never):Int;
	public var data (get,never):Dynamic;

	public inline function new (type:Int, data:Dynamic)
	{
		#if js
		this = #if SFS2X new SFSDataWrapperJs(type, data) #else { type: type, value: data } #end;
		#else
		this = new SFSDataWrapperNative(type, data);
		#end
	}

	private inline function get_data ():Dynamic
	{
		#if js
		return this.value;
		#else
		return this.data;
		#end
	}

	private inline function get_type ():Dynamic
	{
		return this.type;
	}
}

#if js

#if SFS2X
@:native('SFS2X.SFSDataWrapper')
private extern class SFSDataWrapperJs
{
	public var type(default,null):Int;
	public var value(default, null):Dynamic;
	public function new(type:Int, value:Dynamic);
}
#else
private typedef SFSDataWrapperJs = {
	type:Int,
	value:Dynamic
}
#end

#else

private class SFSDataWrapperNative
{
	public var type(default, null):Int;
	public var data(default, null):Dynamic;

	public function new(type:Int, data:Dynamic)
	{
		this.type = type;
		this.data = data;
	}
}

#end